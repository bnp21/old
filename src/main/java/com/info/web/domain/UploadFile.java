package com.info.web.domain;

import java.io.Serializable;

/**
 * 계정 정보
 */
public class UploadFile implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer size;
    //게시판 ID
    private String  name;

    private String  error;

    private String  files;

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }
}
