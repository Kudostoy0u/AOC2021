-- Plan is to replace the taken bingo slots with 0s, add everything on the bingo card together since 0s don't add anything anyways and if a row/column sums to 0 then that bingo card won
main = do
    input <- readFile "input/Day4.txt"
    print $ lines input