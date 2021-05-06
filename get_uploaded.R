library(httr)
get_uploaded_fnames <- function() {
  req <- GET("https://api.github.com/repos/cjcallag/transfer_audit/git/trees/598ef9eb93874280f408dd37f5ec0855a82f6214")
  stop_for_status(req)
  res <- grep("*.pdf$", 
       sapply(content(req)$tree, "[[", "path"),
       value = TRUE)
  out <- sapply(res, function(x) paste0(
  "https://github.com/cjcallag/transfer_audit/blob/main/deeds/", x))
  names(out) <- gsub(".pdf", "", names(out))
  out
}
get_uploaded_fnames()
