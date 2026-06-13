def main():
    with open("./Log Writer/users.csv", "a") as file:
        file.write("1,Alice,Engineer\n")

if __name__ == "__main__":
    main()