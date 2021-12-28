module Main where
import Day1
import Day2 
import Day3
import Day4
import Day5
import Day6
compose x = readFile $ concat ["input/Day",show x, ".txt"]
runDay day file fn = concat ["\n\nDAY ",day," ANSWERS:\n\nPART 1: ",show $ fn False file,"\n\nPART 2: ",show $ fn True file]
main = do
    file1 <- compose 1
    file2 <- compose 2
    file3 <- compose 3
    file4 <- compose 4
    file5 <- compose 5
    file6 <- compose 6
    putStrLn $ runDay "1" file1 day1
    putStrLn $ runDay "2" file2 day2
    putStrLn $ runDay "3" file3 day3
    putStrLn $ runDay "4" file4 day4
    putStrLn $ runDay "5" file5 day5
    putStrLn $ runDay "6" file6 day6