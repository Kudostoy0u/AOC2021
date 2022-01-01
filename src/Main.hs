module Main where
import Day1 ( day1 )
import Day2 ( day2 ) 
import Day3 ( day3 )
import Day4 ( day4 )
import Day5 ( day5 )
import Day6 ( day6 )
import Day7 ( day7 )
import Day8 ( day8 ) 
import Day9 ( day9 )
compose x = readFile $ concat ["input/Day",show x, ".txt"]
runDay day file fn = concat ["\n\nDAY ",day," ANSWERS:\n\nPART 1: ",show $ fn False file,"\n\nPART 2: ",show $ fn True file]
main = do
    file1 <- compose 1
    file2 <- compose 2
    file3 <- compose 3
    file4 <- compose 4
    file5 <- compose 5
    file6 <- compose 6
    file7 <- compose 7
    file8 <- compose 8 
    file9 <- compose 9
    putStrLn $ runDay "1" file1 day1
    putStrLn $ runDay "2" file2 day2
    putStrLn $ runDay "3" file3 day3
    putStrLn $ runDay "4" file4 day4
    putStrLn $ runDay "5" file5 day5
    putStrLn $ runDay "6" file6 day6
    putStrLn $ runDay "7" file7 day7
    putStrLn $ runDay "8" file8 day8
    putStrLn $ runDay "9" file9 day9