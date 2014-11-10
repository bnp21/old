package com.info.web.notice.controller;

import com.info.web.atnews.service.AtnewsService;
import com.info.web.domain.Atnews;
import com.info.web.domain.Notice;
import com.info.web.notice.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 * <pre>
 * 계정 Controller.
 * </pre>
 *
 * -------------------
 * 작성 내역
 * -------------------
 * 작성자 : 이소정
 * 작성일 : 2014.07.10
 * -------------------
 * 수정자 :
 * 수정일 :
 * -------------------
 */
@Controller
@RequestMapping(value = "/")
public class NoticeController {

    //운영서버시
    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
    //개발서버시
    //private String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

    @Autowired
    private NoticeService noticeService;

    /**
     * 인덱스 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/notice/view/{seq}"}, method = RequestMethod.GET)
    public String view(Model model, @PathVariable("seq") String seq) {
        Notice notice = new Notice();
        notice.setSeq(Integer.parseInt(seq));

        //조회수 증가
        noticeService.selectNoticeViewCnt(notice);
        Notice noticeView = noticeService.selectNoticeView(notice);

        model.addAttribute("noticeView", noticeView);

        return "/notice/view";
    }

    @RequestMapping(value = {"/notice/filedown/{fileSeq}"}, method = RequestMethod.GET)
    public String download(Model model,HttpServletRequest request, HttpServletResponse response, @PathVariable("fileSeq") String fileSeq) throws IOException {
        Notice notice = new Notice();
        notice.setFileSeq(Integer.parseInt(fileSeq));

        //조회수 증가
        List<Notice> noticeFileList = noticeService.selectNoticeFileList(notice);

        if( noticeFileList != null && noticeFileList.size() > 0 ) {
            // 파일을 읽어 스트림에 담기
            File file = null;
            InputStream in = null;
            Boolean skip = false;
            String fileName = noticeFileList.get(0).getRealFilename(); //실제파일명
            String downFileName = noticeFileList.get(0).getFilename(); //다운로드파일
            OutputStream os = null;

            try{
             //version issue   file = new File(environment.getProperty("upload.filepath")+"notice/"+fileName);
                file = new File(upload_path+"notice/"+fileName);
                in = new FileInputStream(file);

            }catch(FileNotFoundException fe){
                skip = true;
                //setContentType을 프로젝트 환경에 맞추어 변경
                response.setContentType("application/x-msdownload");
                PrintWriter printwriter = response.getWriter();
                printwriter.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

                printwriter.flush();
                printwriter.close();

                //return "<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>";
                return "";
                //return "";
            }

            String userAgent = request.getHeader("User-Agent");

            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");

            if(!skip) {
                //IE
                if(userAgent.indexOf("MSIE") != -1){
                    response.setHeader ("Content-Disposition", "attachment; filename="+new String(downFileName.getBytes("KSC5601"),"ISO8859_1"));
                }else{
                    // 한글 파일명 처리
                    downFileName = new String(downFileName.getBytes("utf-8"),"iso-8859-1");
                     response.setHeader("Content-Disposition", "attachment; filename=\"" + downFileName + "\"");
                     response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader ("Content-Length", ""+file.length() );
                os = response.getOutputStream();
                byte b[] = new byte[(int)file.length()];
                int leng = 0;
                while( (leng = in.read(b)) > 0 ){
                    os.write(b,0,leng);
                }
                return "";
            }else{
                //setContentType을 프로젝트 환경에 맞추어 변경
                response.setContentType("application/x-msdownload");
                PrintWriter printwriter = response.getWriter();
                printwriter.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

                printwriter.flush();
                printwriter.close();

                //return "<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>";
                return "";
            }
        }else{
            //setContentType을 프로젝트 환경에 맞추어 변경
            response.setContentType("application/x-msdownload");
            PrintWriter printwriter = response.getWriter();
            printwriter.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");

            printwriter.flush();
            printwriter.close();

            //return "<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>";
            return "";
        }
    }
}
