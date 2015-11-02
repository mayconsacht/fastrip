user = User.create(name: "Maycon Sacht", email: "maycon.sacht@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cpf: "08564013908")
User.create(name: "Sandy Cristina", email: "sandy@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cpf: "08564013908")
User.create(name: "Wilian Lecin", email: "wilian@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cpf: "08564013908")
User.create(name: "Roseti Kasmirski", email: "roseti@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cpf: "08564013908")
company = Company.create(name: "Fastrip", email: "fastrip@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cnpj: "08564013908")
Company.create(name: "Viaja", email: "viaja@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cnpj: "08564013908")
Company.create(name: "Trip", email: "trip@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cnpj: "08564013908")
trip = Trip.create(name: "XXXperience", origin: "Jaraguá do Sul", destination: "Curitiba", price: 25.10)
Trip.create(name: "Tribaltech", origin: "Jaraguá do Sul", destination: "Curitiba", price: 25.10)
trip.company = company
trip.save!