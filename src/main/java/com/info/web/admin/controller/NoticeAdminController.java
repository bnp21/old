package com.info.web.admin.controller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.domain.Account;
import com.info.web.domain.Notice;
import com.info.web.domain.FileInfo;
import com.info.web.notice.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * <pre>
 * 계정 Controller.
 * </pre>
 *
 * -------------------
 * 작성 내역
 * -------------------
 * 작성자 : 임세환
 * 작성일 : 2013.12.11
 * -------------------
 */
@Controller
@RequestMapping(value = "/admin")
public class NoticeAdminController {

    //운영서버시
    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
    //개발서버시
    //private String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

    @Autowired
    private NoticeService noticeService;



    /**
     * 알림마당 관리 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/notice/index","/notice"}, method = RequestMethod.GET)
    public String list(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Notice notice = new Notice();

        List<Notice> noticeList = noticeService.selectNoticeList(notice);


        model.addAttribute("noticeList", noticeList);

        return "admin/notice/index";
    }
    /**
     * 알림마당 리스트 가져오기
     *
     * @return
     */
    @RequestMapping(value = "/notice/getNoticeList", method = RequestMethod.GET)
    @ResponseBody
    public List getNoticeArea() {

        Notice notice = new Notice();
        List<Notice> noticeList = noticeService.selectNoticeList(notice);
        return noticeList;

    }

    /**
     * 알림마당 관리 쓰기 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/notice/write/{mode}/{seq}"}, method = RequestMethod.GET)
    public String write(@PathVariable("mode") String mode, @PathVariable("seq") Integer seq, Model model,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Notice notice = new Notice();
        Notice noticeView = null;

        //아이디
        Account account = AuthenticationUtils.getUser();

        //수정모드
        if( mode.equals("mody") ) {
            notice.setSeq(seq);
            noticeView = noticeService.selectNoticeView(notice);

            if( account.getId() != noticeView.getAccountId() ) {

                //model.addAttribute("noticeView", noticeView);   //로그인 후 밑에거 주석제거함
                return "redirect:/admin/notice/index";

            }else {

                if (noticeView.getTopYn().equals("Y")) {
                    noticeView.setTopYn("checked");
                }
                noticeView.setTopYn("checked");

                model.addAttribute("noticeView", noticeView);
            }
            /*파일삭제*/
        }else if( mode.equals("delFile") ) {
            notice.setSeq(seq);
            Notice noticeView2 = noticeService.selectNoticeView(notice);

            if (account.getId() != noticeView2.getAccountId()) {

            } else {
                if( seq != null ) {
                    FileInfo fileInfo = new FileInfo();
                    if( noticeView2.getFileSeq() != 0 ) {
                        fileInfo.setFileNo(noticeView2.getFileNo());
                        fileInfo.setSeq(noticeView2.getFileSeq());
                        int deleteFileCount = noticeService.deleteNoticeFile(fileInfo);
                    }
                }
            }
            return "redirect:/admin/notice/write/mody/"+seq;
        }
        return "admin/notice/write";
    }

    /**
     * 알림마당 관리 등록
     *
     * @return
     */
    @RequestMapping(value = "/notice/insertNotice", method = RequestMethod.POST)
    public String insertNotice(@ModelAttribute("notice") Notice notice,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        if( notice.getTopYn() == null ){
            notice.setTopYn("N");
        }
        Account account = AuthenticationUtils.getUser();
        notice.setAccountId(account.getId());

        if( file != null && file.getSize() > 0 ) {
            String fileName = file.getOriginalFilename();
            String fileMime = file.getContentType();

            int fileseq = 0;
            int fileno = 0;
            int fileCount = 0;
            String mode = "";


            if( notice.getFileSeq() != null && notice.getFileSeq() != 0 ) {
                fileseq = notice.getFileSeq();
                fileCount = noticeService.selectFileCount(fileseq);
                if( fileCount > 0 ){
                    fileno = notice.getFileNo();
                    mode = "mody";
                }else{
                    fileno = noticeService.selectFileNo(fileseq);
                    mode = "ins";
                }
            }else {
                fileseq = noticeService.selectFileSeq();
                fileno = 1;
                notice.setFileSeq(fileseq);
            }

            GregorianCalendar gc = new GregorianCalendar();
            SimpleDateFormat simDate = new SimpleDateFormat("yyyyMMddHHmmss");
            Date nowTime = gc.getTime();
            String[] ArrFileName = null;

            if( fileName.indexOf(".") >= 0 ) {
                ArrFileName = fileName.split("\\.");
            }
            //version issue file.transferTo(new File(environment.getProperty("upload.filepath")+"notice/"+ArrFileName[0] + "_" + simDate.format(nowTime)+"."+ArrFileName[1]));
            //System.out.println("파일경로==>"+upload_path+"notice/"+ ArrFileName[0] + "_" + simDate.format(nowTime)+"."+ArrFileName[1]);

            file.transferTo(new File(upload_path+"notice/"+ ArrFileName[0] + "_" + simDate.format(nowTime)+"."+ArrFileName[1]));

            FileInfo fileInfo = new FileInfo();
            fileInfo.setSeq(fileseq);
            fileInfo.setFilename(fileName);
            fileInfo.setRealFilename(ArrFileName[0] + "_" + simDate.format(nowTime)+"."+ArrFileName[1]);
            fileInfo.setFilesize(file.getSize());
            fileInfo.setFileNo(fileno);
            fileInfo.setFilemime(fileMime);

            //System.out.println("mode==>"+mode);

            if( mode.equals("mody")){
                int fileUpdateCount = noticeService.updateNoticeFile(fileInfo);
            }else {
                int fileInsertCount = noticeService.insertNoticeFile(fileInfo);
            }
        }else if(notice.getDelfile().equals("Y")){
            notice.setSeq(notice.getSeq());
            Notice noticeView = noticeService.selectNoticeView(notice);
            FileInfo fileInfo = new FileInfo();
            if( noticeView.getFileSeq() != 0 ) {
                fileInfo.setFileNo(noticeView.getFileNo());
                fileInfo.setSeq(noticeView.getFileSeq());

                int deleteFileCount = noticeService.deleteNoticeFile(fileInfo);

            }
            notice.setFileSeq(noticeView.getFileSeq());
        }else if(!notice.getDelfile().equals("Y") && notice.getFileSeq() != null && !notice.getFileSeq().equals("")){

        }else{
            notice.setFileSeq(0);
        }

        if( notice.getSeq() != null ) {
            int updateCount = noticeService.updateNotice(notice);
        }else{
            int insertCount = noticeService.insertNotice(notice);
        }

        return "redirect:/admin/notice/index";
    }

    /**
     * 알림마당 관리 삭제
     *
     * @return
     */
    @RequestMapping(value = "/notice/mody/{mode}/{seq}", method = RequestMethod.GET)
    public String del(@PathVariable("mode") String mode, @PathVariable("seq") Integer seq, Model model,RedirectAttributes redirectAttributes, HttpServletRequest  request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Notice notice = new Notice();

        Account account = AuthenticationUtils.getUser();

        if( mode.equals("del") ) {
            notice.setSeq(seq);
            Notice noticeView = noticeService.selectNoticeView(notice);

            if (account.getId() != noticeView.getAccountId()) {

                return "redirect:/admin/notice/index";
            } else {
                if( seq != null ) {
                    int deleteCount = noticeService.deleteNotice(seq);
                    FileInfo fileInfo = new FileInfo();

                    if( noticeView.getFileSeq() != 0 ) {
                        fileInfo.setFileNo(noticeView.getFileNo());
                        fileInfo.setSeq(noticeView.getFileSeq());
                        int deleteFileCount = noticeService.deleteNoticeFile(fileInfo);
                    }
                }
            }
        }
        return "redirect:/admin/notice/index";
    }
}
