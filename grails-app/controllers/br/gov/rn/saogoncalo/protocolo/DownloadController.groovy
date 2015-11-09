package br.gov.rn.saogoncalo.protocolo

import org.apache.commons.io.IOUtils

class DownloadController {
  def downloadFile() {
    InputStream contentStream
    try {
        def file = new File("")  
        response.setHeader "Content-disposition", "attachment; filename=filename-with-extension"
        response.setHeader("Content-Length", "file-size")
        response.setContentType("file-mime-type")
        contentStream = file.newInputStream()
        response.outputStream << contentStream
        webRequest.renderView = false
    } finally {
        IOUtils.closeQuietly(contentStream)
    }
  }
}
