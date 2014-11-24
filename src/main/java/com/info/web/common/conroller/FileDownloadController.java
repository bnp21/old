package com.info.web.common.conroller;

/**
 * Created by Ljd on 2014-10-12.
 */


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@Controller
@RequestMapping("/download")
public class FileDownloadController {

    @RequestMapping(value =  {"/hwp"}, method = RequestMethod.GET)
    public String hwp(Model model) {

        return "download/hwp";

    }

    @RequestMapping(value =  {"/excel/{fileGbn}"}, method = RequestMethod.GET)
    public String excel(Model model, @PathVariable("fileGbn") String fileGbn, HttpServletRequest request, HttpServletResponse response) {

        //request.setCharacterEncoding("UTF-8");

        // 파일 업로드된 경로
        String root = request.getSession().getServletContext().getRealPath("/");
        //운영서버시
        //String upload_path = "/d02/wassrc/info_upload/";
        String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
        //개발서버시
        //String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

        String filename ="";
        String orgfilename ="";
        //String fileGbn=(String)request.getParameter("fileGbn");
        // 서버에 실제 저장된 파일명

        //System.out.println("fileGbn==>"+fileGbn);
        //System.out.println("upload_path==>"+upload_path);

        if(fileGbn.equals("01")){
            filename="farm-dealTrend.xlsx"; //주요농산물일일거래동향
            orgfilename="farm-dealTrend.xlsx";
        }else if(fileGbn.equals("02")){     //주요 가공식품 주간 가격동향
            filename="ProcessedFood.xlsx";
            orgfilename="ProcessedFood.xlsx";
        }else if(fileGbn.equals("03")){ //주요 원자재 주간가격동향
            filename="InternationalRawMaterial.xlsx";
            orgfilename="InternationalRawMaterial.xlsx";
        }else if(fileGbn.equals("04")){     //일일공물시황
            filename="grain-marketCondition.xlsx";
            orgfilename="grain-marketCondition.xlsx";
        }


        InputStream in = null;
        OutputStream os = null;
        File file = null;
        boolean skip = false;
        String client = "";


        try{


            // 파일을 읽어 스트림에 담기
            try{
                file = new File(upload_path, filename);
                in = new FileInputStream(file);
            }catch(FileNotFoundException fe){
                skip = true;
            }




            client = request.getHeader("User-Agent");

            // 파일 다운로드 헤더 지정
            response.reset() ;
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");


            if(!skip){


                // IE
                if(client.indexOf("MSIE") != -1){
                    response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));

                }else{
                    // 한글 파일명 처리
                    orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");

                    response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }

                response.setHeader ("Content-Length", ""+file.length() );



                os = response.getOutputStream();
                byte b[] = new byte[(int)file.length()];
                int leng = 0;

                while( (leng = in.read(b)) > 0 ){
                    os.write(b,0,leng);
                }

            }else{
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

            }

            in.close();
            os.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        return "";

    }

    @RequestMapping(value = {"/downloadFile/{requestedFile}"}, method = RequestMethod.GET)
    public void downloadFile(@PathVariable("requestedFile") String requestedFile, HttpServletResponse response) throws Exception {

        //String uploadPath = fileUploadProperties.getProperty("file.upload.path");

        // 파일 다운로드된 경로
        //운영서버시
        //String upload_path = "/d02/wassrc/info_upload/";
         String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
        //개발서버시
        //String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

        //System.out.println("upload_path ==>" + upload_path+requestedFile);

        File uFile = new File(upload_path, requestedFile);
        int fSize = (int) uFile.length();

        //System.out.println("fSize : " + fSize);

        if (fSize > 0) {


            BufferedInputStream in = new BufferedInputStream(
                    new FileInputStream(uFile));
            // String mimetype = servletContext.getMimeType(requestedFile);
            // String mimetype = "image/jpeg";

            response.setBufferSize(fSize);
            //response.setContentType(mimetype);
            response.setHeader("Content-Disposition", "attachment; filename=\""
                    + requestedFile + "\"");
            response.setContentLength(fSize);

            FileCopyUtils.copy(in, response.getOutputStream());
            in.close();
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } else {
            //setContentType을 프로젝트 환경에 맞추어 변경
            response.setContentType("application/x-msdownload");
            PrintWriter printwriter = response.getWriter();
            printwriter.println("<html>");
            printwriter.println("<br><br><br><h2>Could not get file name:<br>"
                    + requestedFile + "</h2>");
            printwriter
                    .println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
            printwriter.println("<br><br><br>&copy; webAccess");
            printwriter.println("</html>");
            printwriter.flush();
            printwriter.close();
        }
    }
}
