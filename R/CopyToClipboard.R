#' Copy Stuff to Clipboard
#' 
#' Simple function to copy R elements to the clipboard for easy pasting
#' @param R elements (tested only on vectors)
#' @keywords copy, and, paste
#' @export
#' @examples
#' CopyToClipboard(data)
CopyToClipboard <- function(data,
                            use_colnames = F,
                            use_rownames = F,
                            sep = " ") {
   clip <- pipe("pbcopy","w")
   write.table(data,file=clip,row.names = use_rownames,col.names=use_colnames, sep =sep)
   close(clip)
}