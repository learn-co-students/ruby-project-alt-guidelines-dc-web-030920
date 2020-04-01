# Player.destroy_all
# # Coach.destroy_all
# # Session.destroy_all


Player.create(name: "Kobe Bryant", jersey: 24, team:"Lakers")
Player.create(name: "Micheal Jordan", jersey: 23, team:"Bulls")
Player.create(name: "Lebron James", jersey: 23, team:"Cavaliers")
Player.create(name: "John Wall", jersey: 11, team:"Wizards")

Coach.create(name: "Doc Rivers", specialty: "Defense")
Coach.create(name: "Phil Jackson", specialty: "Offense")
Coach.create(name: "Greg Pop", specialty: "Training")

Session.create(player_id: 1, coach_id: 1, session_date: "03/24/2020", session_time: "02 pm")
Session.create(player_id: 2, coach_id: 3, session_date: "03/25/2020", session_time: "03 pm")
Session.create(player_id: 3, coach_id: 1, session_date: "03/26/2020", session_time: "04 pm")
Session.create(player_id: 4, coach_id: 2, session_date: "03/27/2020", session_time: "03 pm")



