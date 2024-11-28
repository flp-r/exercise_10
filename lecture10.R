Task 1
. in R, implement a function SuffixArray() to create a suffix array
from a string
. input:
  . a DNAString object
. output:
  . a vector of integers



library(Biostrings)



SuffixArray <- function(dna_string) {
  # Initialize vectors to store suffixes and indices
  suffixes <- c()
  indices <- c()
  
  # Extract suffixes and their starting positions
  for (i in 1:nchar(dna_string)) {
    suffix <- subseq(dna_string, start = i)  # Extract the suffix
    suffixes <- c(suffixes, as.character(suffix))  # Store suffix as a string
    indices <- c(indices, i)  # Store the starting index
  }
  
  # Sort suffixes alphabetically and get the order of indices
  sorted_order <- order(suffixes)
  suffix_array <- indices[sorted_order]
  
  # Return the suffix array
  return(suffix_array)
}


DNASequence <- DNAString("CTAATAATG")
suffix_array <- SuffixArray(DNASequence)
print(suffix_array)


InverseSuffixArray <- function(suffix_array) {
  # Initialize the inverse suffix array
  n <- length(suffix_array)
  inverse_suffix_array <- numeric(n)
  
  # Populate the inverse suffix array
  for (i in seq_along(suffix_array)) {
    inverse_suffix_array[suffix_array[i]] <- i
  }
  
  # Return the inverse suffix array
  return(inverse_suffix_array)
}

inverse_suffix_array <- InverseSuffixArray(suffix_array)
print(inverse_suffix_array)



LCPArray <- function(text, SA, ISA){
  m <- length(text)
  text <- DNAString(paste0(as.character(text), "+"))
  LCP <- numeric(m)
  LCP[1] <- -1
  LCP[m + 1] <- -1
  
  l <- 0
  
  for (i in 1:m){
    j <- ISA[i]
    if (j > 1){
      k <- SA[j - 1]
      while (text[k + l] == text[i + l]){
        l <- l + 1
      }
      LCP[j] <- l
      l <- max(l - 1, 0)
    }
    
  }
  return(LCP)
  
}
  

text <- DNAString("CTAATAATG")
SA <- SuffixArray(text)
ISA <- InverseSuffixArray(SA)
LCP_array <- LCPArray(text, SA, ISA)
LCP_array

