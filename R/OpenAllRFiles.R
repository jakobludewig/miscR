#' Open All R Files in Current Directory for Editing
#' 
#' Simple shortcut function to open all R files in current working directory for editing in RStudio
#' @param none
#' @keywords convenience, wrapper, file, editing
#' @export
#' @examples
#' OpenAllRFiles()
OpenAllRFiles <- function() {
   lapply(list.files(pattern="*.R"),file.edit)
}
