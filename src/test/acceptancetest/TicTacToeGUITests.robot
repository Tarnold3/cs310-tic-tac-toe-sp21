*** Settings ***
Library          SwingLibrary

*** Keywords ***
Start New 3x3 Game
    Start Application   edu.jsu.mcis.cs310.tictactoe.TicTacToe
    Select Window       Tic-Tac-Toe

Start New 5x5 Game
    Start Application   edu.jsu.mcis.cs310.tictactoe.TicTacToe  5
    Select Window       Tic-Tac-Toe

Start New 7x7 Game
    Start Application   edu.jsu.mcis.cs310.tictactoe.TicTacToe  7
    Select Window       Tic-Tac-Toe

Mark Location   [Arguments]     ${row}      ${col}
    ${component}=   Catenate    SEPARATOR=  Square    ${row}  ${col}
    Click On Component  ${component}

Check Location  [Arguments]     ${row}  ${col}  ${mark}
    ${component}=   Catenate    SEPARATOR=  Square    ${row}  ${col}
	${text}=    Get Button Text   ${component}
    Should Be Equal    ${text}    ${mark}
    
Winner Should Be    [Arguments]     ${winner}
	${text}=    Get Label Content    ResultLabel
    Should Be Equal    ${text}    ${winner}
    Close Window    Tic-Tac-Toe
    
*** Test Cases ***
Win Diagonally as X (3x3)
    Start New 3x3 Game
    Mark Location       1   1
    Check Location      1   1   X
    Mark Location       0   1
    Check Location      0   1   O
    Mark Location       0   0
    Check Location      0   0   X
    Mark Location       0   2
    Check Location      0   2   O
    Mark Location       2   2
    Check Location      2   2   X
    Winner Should Be    X

Win Horizontally as O (3x3)
    Start New 3x3 Game
    Mark Location       1   1
    Check Location      1   1   X
    Mark Location       2   0
    Check Location      2   0   O
    Mark Location       0   0
    Check Location      0   0   X
    Mark Location       2   2
    Check Location      2   2   O
    Mark Location       0   2
    Check Location      0   2   X
    Mark Location       2   1
    Check Location      2   1   O
    Winner Should Be    O

Force a Tie (3x3)
    Start New 3x3 Game
    Mark Location       1   1
    Check Location      1   1   X
    Mark Location       0   0
    Check Location      0   0   O
    Mark Location       2   0
    Check Location      2   0   X
    Mark Location       0   2
    Check Location      0   2   O
    Mark Location       0   1
    Check Location      0   1   X
    Mark Location       2   1
    Check Location      2   1   O
    Mark Location       1   2
    Check Location      1   2   X
    Mark Location       1   0
    Check Location      1   0   O
    Mark Location       2   2
    Check Location      2   2   X
    Winner Should Be    TIE

Win Diagonally as X (5x5)
    Start New 5x5 Game
    Mark Location       2   2
    Check Location      2   2   X
    Mark Location       0   0
    Check Location      0   0   O
    Mark Location       0   4
    Check Location      0   4   X
    Mark Location       1   0
    Check Location      1   0   O
    Mark Location       1   3
    Check Location      1   3   X
    Mark Location       2   0
    Check Location      2   0   O
    Mark Location       3   1
    Check Location      3   1   X
    Mark Location       3   0
    Check Location      3   0   O
    Mark Location       4   0
    Check Location      4   0   X
    Winner Should Be    X

Win Vertically as O (5x5)
    Start New 5x5 Game
    Mark Location       2   2
    Check Location      2   2   X
    Mark Location       0   4
    Check Location      0   4   O
    Mark Location       0   0
    Check Location      0   0   X
    Mark Location       4   4
    Check Location      4   4   O
    Mark Location       1   2
    Check Location      1   2   X
    Mark Location       0   2
    Check Location      0   2   O
    Mark Location       2   3
    Check Location      2   3   X
    Mark Location       1   4
    Check Location      1   4   O
    Mark Location       2   1
    Check Location      2   1   X
    Mark Location       2   4
    Check Location      2   4   O
    Mark Location       3   2
    Check Location      3   2   X
    Mark Location       3   4
    Check Location      3   4   O
    Winner Should Be    O

Win Horizontally as X (5x5)
    Start New 5x5 Game
    Mark Location       2   2
    Check Location      2   2   X
    Mark Location       0   2
    Check Location      0   2   O
    Mark Location       2   3
    Check Location      2   3   X
    Mark Location       0   3
    Check Location      0   3   O
    Mark Location       2   4
    Check Location      2   4   X
    Mark Location       0   4
    Check Location      0   4   O
    Mark Location       2   0
    Check Location      2   0   X
    Mark Location       1   0
    Check Location      1   0   O
    Mark Location       4   4
    Check Location      4   4   X
    Mark Location       1   1
    Check Location      1   1   O
    Mark Location       2   1
    Check Location      2   1   X
    Winner Should Be    X

Win Diagonally as O (7x7)
    Start New 7x7 Game
    Mark Location       0   0
    Check Location      0   0   X
    Mark Location       3   3
    Check Location      3   3   O
    Mark Location       6   6
    Check Location      6   6   X
    Mark Location       0   6
    Check Location      0   6   O
    Mark Location       6   5
    Check Location      6   5   X
    Mark Location       1   5
    Check Location      1   5   O
    Mark Location       6   4
    Check Location      6   4   X
    Mark Location       2   4
    Check Location      2   4   O
    Mark Location       6   3
    Check Location      6   3   X
    Mark Location       4   2
    Check Location      4   2   O
    Mark Location       6   2
    Check Location      6   2   X
    Mark Location       5   1
    Check Location      5   1   O
    Mark Location       6   1
    Check Location      6   1   X
    Mark Location       6   0
    Check Location      6   0   O
    Winner Should Be    O
