def display_board(board):
    for row in board:
        print("|".join(row))
        print("-----")

def check_winner(board):
    # Check rows
    for row in board:
        if all(cell == row[0] and cell != ' ' for cell in row):
            return row[0]
   
    # Check columns
    for col in range(3):
        if all(board[row][col] == board[0][col] and board[row][col] != ' ' for row in range(3)):
            return board[0][col]
   
    # Check diagonals
    if (board[0][0] == board[1][1] == board[2][2] != ' ') or (board[0][2] == board[1][1] == board[2][0] != ' '):
        return board[1][1]
   
    return None

def is_board_full(board):
    for row in board:
        if ' ' in row:
            return False
    return True

def main():
    board = [[' ']*3 for _ in range(3)]
    players = ['X', 'O']
    current_player = 0

    while True:
        display_board(board)
        player_move = input(f"Player {players[current_player]}, enter your move (row col): ").split()
        row, col = map(int, player_move)

        if board[row][col] == ' ':
            board[row][col] = players[current_player]
            winner = check_winner(board)
            if winner:
                display_board(board)
                print(f"Player {winner} wins!")
                break
            elif is_board_full(board):
                display_board(board)
                print("It's a tie!")
                break
            else:
                current_player = (current_player + 1) % 2
        else:
            print("That position is already taken. Try again.")

    play_again = input("Do you want to play again? (yes/no): ")
    if play_again.lower() == 'yes':
        main()
    else:
        print("Thanks for playing!")

if __name__ == "__main__":
    main()
