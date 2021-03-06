read.snps.long <-function(files, sample.id=NULL, snp.id=NULL, diploid=NULL,
                         fields=c(sample=1, snp=2, genotype=3, confidence=4),
                         codes=c("0", "1", "2"), threshold=0.9, lower=TRUE,
                         sep=" ", comment="#",  skip=0,
                         simplify=c(FALSE, FALSE),
                         verbose=FALSE, in.order=TRUE, every=1000) {
  if (any(duplicated(files)))
    stop("duplicated input file name(s)")
  if (any(duplicated(sample.id)))
    stop("duplicated target sample identifier(s)")
  if (any(duplicated(snp.id)))
    stop("duplicated target SNP identifier(s)")
  if (!is.null(diploid) && any(is.na(diploid)))
    stop("diploid argument contains one or more NA's")
  if (length(diploid)==1)
    diploid <- rep(diploid, length(sample.id))
  if (!is.integer(fields))
    mode(fields) <- "integer"
  .Call("insnp_new", files, sample.id, snp.id, diploid, fields,
        codes, threshold, lower, sep, comment, as.integer(skip),
        simplify, verbose, in.order, as.integer(every), PACKAGE="snpStats")
}

read.mach <- function(file, colnames=NULL, nrow=NULL) {
  .Call("read_mach", file, colnames, nrow, PACKAGE="snpStats")
}

read.impute <- function(file, rownames=NULL, nsnp=NULL, snpcol=2) {
  .Call("read_impute", file, rownames, nsnp, snpcol, FALSE, PACKAGE="snpStats")
}
read.beagle <- function(file, rownames=NULL, nsnp=NULL, header=TRUE) {
  .Call("read_impute", file, rownames, nsnp, 0, header, PACKAGE="snpStats")
}
