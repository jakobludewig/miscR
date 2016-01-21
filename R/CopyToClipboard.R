#' Copy Stuff to Clipboard
#' 
#' Simple function to copy R elements to the clipboard for easy pasting
#' @param R elements (tested only on vectors)
#' @keywords copy, and, paste
#' @export
#' @examples
#' CopyToClipboard(data)
CopyToClipboard <- function(data) {
   clip <- pipe("pbcopy","w")
   write.table(data,file=clip,row.names = F,col.names=F)
   close(clip)
}