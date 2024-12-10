user1 = User.first || User.create(email: "user1@example.com", password: "password")
user2 = User.first || User.create(email: "user2@example.com", password: "password")

project1 = Project.first || Project.create(name: "Project 1", user_id: user1.id)
project2 = Project.first || Project.create(name: "Project 2", user_id: user2.id)

board1 = Board.create(name: "Board 1", user_id: user1.id, project_id: project1.id)
board2 = Board.create(name: "Board 2", user_id: user2.id, project_id: project2.id)

category1 = Category.create(name: "To Do")
category2 = Category.create(name: "In Progress")
category3 = Category.create(name: "Done")

Task.create(title: "Creative writing", description: "Magnam neque laudantium hic.", board_id: board1.id, category_id: category1.id, user_id: user1.id)
Task.create(title: "Finish report", description: "Complete the annual report.", board_id: board1.id, category_id: category2.id, user_id: user1.id)
Task.create(title: "Clean workspace", description: "Organize the office space.", board_id: board1.id, category_id: category3.id, user_id: user1.id)

Task.create(title: "Prepare presentation", description: "Create slides for the team presentation.", board_id: board2.id, category_id: category1.id, user_id: user2.id)
Task.create(title: "Develop feature", description: "Implement new feature in the app.", board_id: board2.id, category_id: category2.id, user_id: user2.id)
Task.create(title: "Update documentation", description: "Update project documentation.", board_id: board2.id, category_id: category3.id, user_id: user2.id)

puts "Seeding complete!"
