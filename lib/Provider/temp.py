import tkinter as tk
import tkinter.messagebox as msg
import random


class MemoryGame:
    def __init__(self, master):
        self.master = master
        self.master.title("Memory Game")
        self.master.geometry("400x450")

        self.colors = {
            1: "red",
            2: "blue",
            3: "green",
            4: "yellow",
            5: "orange",
            6: "purple",
            7: "pink",
            8: "brown",
            9: "cyan"
        }

        self.contrasting_colors = {
            "red": "white",
            "blue": "white",
            "green": "white",
            "yellow": "black",
            "orange": "black",
            "purple": "white",
            "pink": "black",
            "brown": "white",
            "cyan": "black"
        }

        self.tiles = []
        self.board = []
        self.parity = None
        self.pair_count = 0
        self.chance_count = 0
        self.start_time = None
        self.elapsed_time = 0
        self.time_running = False
        self.create_board()
        self.create_info_labels()

    def create_board(self):
        self.board = [[random.randint(1, 9) for _ in range(4)] for _ in range(4)]

        for i in range(4):
            row = []
            for j in range(4):
                tile = tk.Button(self.master, text="", width=6, height=3, font=("Helvetica", 12),
                                 command=lambda i=i, j=j: self.click_tile(i, j))
                tile.grid(row=i, column=j)
                tile.config(bg="gray", fg="gray")
                row.append(tile)
            self.tiles.append(row)

    def create_info_labels(self):
        self.time_label = tk.Label(self.master, text="Time: 0s", font=("Helvetica", 12))
        self.time_label.grid(row=4, column=0, columnspan=2)

        self.chance_label = tk.Label(self.master, text="Chances left: 2", font=("Helvetica", 12))
        self.chance_label.grid(row=4, column=2, columnspan=2)

    def update_info_labels(self):
        if self.time_running:
            self.elapsed_time += 1
            self.time_label.config(text=f"Time: {self.elapsed_time}s")
            self.master.after(1000, self.update_info_labels)  # Update every second

    def click_tile(self, i, j):
        if self.start_time is None:
            self.start_time = self.master.after(0, self.update_info_labels)
            self.time_running = True

        value = self.board[i][j]
        bg_color = self.colors[value]
        fg_color = self.contrasting_colors[bg_color]
        self.tiles[i][j].config(text=str(value), bg=bg_color, fg=fg_color)
        self.tiles[i][j].config(state=tk.DISABLED)

        if self.pair_count % 2 == 0:
            self.parity = value % 2
        else:
            if value % 2 != self.parity:
                self.chance_count += 1
                self.chance_label.config(text=f"Chances left: {2 - self.chance_count}")
                if self.chance_count >= 2:
                    self.game_over()
                elif self.chance_count == 1:
                    msg.showinfo("One Chance Gone", "You have one chance left!")

        self.pair_count += 1

    def game_over(self):
        self.time_running = False
        elapsed_time = self.elapsed_time
        for i in range(4):
            for j in range(4):
                self.tiles[i][j].config(state=tk.DISABLED)

        game_over_label = tk.Label(self.master, text=f"Game Over!\nTime taken: {elapsed_time} seconds", font=("Helvetica", 16), fg="red")
        game_over_label.grid(row=5, column=0, columnspan=4)


def main():
    root = tk.Tk()
    game = MemoryGame(root)
    root.mainloop()


if __name__ == "__main__":
    main()