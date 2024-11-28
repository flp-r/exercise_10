# Suffix Trees

### Task 1
* In R, implement a function `SuffixArray()` to create a suffix array from a string.

* Input:
    * A `DNAString` object .

* Output:
    * A vector of integers.

### Task 2
* In R, implement a function `InverseSuffixArray()` to create an inverse suffix array from a suffix array.

* Input:
    * A vector of integers representing suffix array.

* Output:
    * A vector of integers.

### Task 3
* In R, implement a function `LCPArray()` according to pseudocode.

* Input:
    * `text` A `DNAString` representing analyzed string.
    * `SA` A vector of integers representing a suffix array.
    * `ISA` A vector of integers representing an inverse suffix array.

* Output:
    * `LCP` A vector of integers.

```
LCPArray(text, SA, ISA)
1   LCP[1] <- -1
2   LCP[m + 1] <- -1
3   l <- 0
4   for i <- 1 to m
5     j <- ISA[i]
6     if j > 1 then
7       k <- SA[j - 1]
8       while text[k + l] = text[i + l] do
9         l <- l + 1
10      LCP[j] <- l
11      l <- max{l - 1, 0}
12  return LCP
```

**Hint:** 
The text will be indexed at *m* + 1 position, that does not exist. Add one character at the end of the text
(in general use `$`, for `DNAString` in R use `+`).


### Task 4
* In R, implement a function `BinarySearchSA()` according to the following pseudocode.

* Input:
    * `pattern` A `DNAString` representing a pattern to be found.
    * `text` A `DNAString` representing a text to be searched.
    * `SA` A vector of integers representing a suffix array of `text`.

* Output:
    * A vector of two integers (the first and the last indexes of suffix array, where the pattern was found).

```
BinarySearchSA(pattern, text, SA)
1   minIndex <- 1
2   maxIndex <- length (text)
3   while minIndex < maxIndex
4     midlIndex <- floor(minIndex + maxIndex) / 2
5     if pattern <= suffix of text starting at position SA(midlIndex)
6       maxIndex <- midlIndex
7     else
8       minIndex <- midlIndex + 1
9   First <- minIndex
10  maxIndex <- length(text)
11  while maxIndex > minIndex
12    midlIndex <- floor(minIndex + maxIndex) / 2
13    if suffix of text starting at position SA(midlIndex) <= pattern
14      minIndex <- midlIndex + 1
15    else
16      maxInd <- midlIndex
17  Last <- maxIndex - 1
18  if Last < First
19    return('Pattern does not appear in text')
20  else
21    return First, Last
```


<details>
<summary>Download files from GitHub</summary>
<details>
<summary>Basic Git settings</summary>

>* Configure the Git editor
>    ```bash
>    git config --global core.editor notepad
>    ```
>* Configure your name and email address
>    ```bash
>    git config --global user.name "Zuzana Nova"
>    git config --global user.email z.nova@vut.cz
>    ```
>* Check current settings
>    ```bash
>    git config --global --list
>    ```
>
</details>

* Create a fork on your GitHub account. 
  On the GitHub page of this repository find a <kbd>Fork</kbd> button in the upper right corner.
  
* Clone forked repository from your GitHub page to your computer:
```bash
git clone <fork repository address>
```
* In a local repository, set new remote for a project repository:
```bash
git remote add upstream https://github.com/mpa-prg/exercise_10.git
```

#### Send files to GitHub
Create a new commit and send new changes to your remote repository.
* Add file to a new commit.
```bash
git add <file_name>
```
* Create a new commit, enter commit message, save the file and close it.
```bash
git commit
```
* Send a new commit to your GitHub repository.
```bash
git push origin main
```

</details>
