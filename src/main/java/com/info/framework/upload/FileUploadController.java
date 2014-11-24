package com.info.framework.upload;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 19
 * Time: 오후 1:53
 * To change this template use File | Settings | File Templates.
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.info.web.domain.UploadFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.info.web.domain.Excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/file")
public class FileUploadController {

    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    private static List<Excel> list = new ArrayList<Excel>();

    @RequestMapping(value =  {"/upload/index", "/upload"}, method = RequestMethod.GET)
    public String index(Excel excel, Model model) {
        model.addAttribute("excel", excel);

        return "admin/upload/index";
    }

    @RequestMapping(value = "/upload/insertExcel", method = RequestMethod.POST)
    public String processForm(@ModelAttribute("excel") Excel excel, BindingResult result) throws IOException{

        FileOutputStream outputStream = null;

        String filePath = "C:\\/" + excel.getFile().getOriginalFilename();
        //System.out.println("filePath==>"+filePath);

        outputStream = new FileOutputStream(new File(filePath));
        outputStream.write(excel.getFile().getFileItem().get());
        //load
        FileInputStream file = new FileInputStream(new File(filePath));

        HSSFWorkbook workbook = new HSSFWorkbook(file);
        HSSFSheet sheet = workbook.getSheetAt(0);

        Iterator<Row> rowIterator = sheet.iterator();

        HashMap<String,String> map = new HashMap<String,String>();

        while (rowIterator.hasNext())
        {
            Row row = rowIterator.next();
            //System.out.println("row.getRowNum()==>"+row.getRowNum());
            if(row.getRowNum()==0){
                //System.out.println("====Excel to DB Insert====");
            }else{

                if(map.containsKey(row.getCell(1).getStringCellValue())){

                }else{
                    list.add(new Excel(row.getCell(0).getStringCellValue(), row.getCell(1).getStringCellValue()));
                }
                map.put(row.getCell(1).getStringCellValue(),row.getCell(0).getStringCellValue());

            }
        }
        file.close();

        //iUploadService.addExcel(list);

        list.clear();

        return "admin/upload/index";
    }

    @RequestMapping(method= RequestMethod.GET)
    public void fileUploadForm() {
    }

    @RequestMapping(method= RequestMethod.POST)
    public String processUpload(@RequestParam MultipartFile file, Model model) throws IOException {
        logger.warn("### 파일업로드 페이지");
        logger.warn("File " + file.getOriginalFilename());
        String fileName = file.getOriginalFilename();
        file.transferTo(new File("C:/upload/"+fileName));

        model.addAttribute("message", "File '" + file.getOriginalFilename() + "' uploaded successfully");
        return "redirect:/profile/index";
    }



}