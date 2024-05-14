# Criando métodos de pagamento
PaymentMethod.create!(
  [
    { credit_card: true, debit_card: true, pix: true, ticket_payment: false },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: true },
    { credit_card: true, debit_card: false, pix: false, ticket_payment: true },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: false },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: true },
    { credit_card: true, debit_card: false, pix: false, ticket_payment: true },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: false },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: true },
    { credit_card: true, debit_card: false, pix: false, ticket_payment: true },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: false },
  ]
)

# Criando endereços
Address.create!(
  [
    { street: "Rua Paulista", number: "1000", neighborhood: "Bela Vista", city: "São Paulo", state: "SP", zip_code: "01310-100" },
    { street: "Avenida Brigadeiro Faria Lima", number: "2000", neighborhood: "Itaim Bibi", city: "São Paulo", state: "SP", zip_code: "01452-000" },
    { street: "Rua Oscar Freire", number: "900", neighborhood: "Jardins", city: "São Paulo", state: "SP", zip_code: "01426-001" },
    { street: "Avenida Paulista", number: "1500", neighborhood: "Cerqueira César", city: "São Paulo", state: "SP", zip_code: "01310-200" },
    { street: "Rua do Lavradio", number: "71", neighborhood: "Centro", city: "Rio de Janeiro", state: "RJ", zip_code: "20230-070" },
    { street: "Rua Barata Ribeiro", number: "716", neighborhood: "Copacabana", city: "Rio de Janeiro", state: "RJ", zip_code: "22040-002" },
    { street: "Avenida Atlântica", number: "1702", neighborhood: "Copacabana", city: "Rio de Janeiro", state: "RJ", zip_code: "22021-001" },
    { street: "Rua Visconde de Pirajá", number: "550", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22410-003" },
    { street: "Rua Maria Quitéria", number: "27", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22410-040" },
    { street: "Avenida Vieira Souto", number: "500", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22420-004" },
  ]
)

# Criando buffets
Buffet.create!(
  [
    { commercial_name: "Delícias da Terra", legal_name: "Delícias da Terra Buffet e Eventos Ltda.", cnpj: "12345678901234", email: "deliciasdaterra@example.com", phone: "11987654321", description: "Especializado em culinária regional brasileira.", address_id: 1, payment_methods_id: 1 },
    { commercial_name: "Sabor Celestial", legal_name: "Sabor Celestial Gastronomia e Eventos Ltda.", cnpj: "56789012345678", email: "saborcelestial@example.com", phone: "21987654321", description: "Oferece pratos da cozinha internacional com toques criativos.", address_id: 2, payment_methods_id: 2 },
    { commercial_name: "Festa dos Sabores", legal_name: "Festa dos Sabores Organização de Eventos Ltda.", cnpj: "56555512340008", email: "festadossabores@example.com", phone: "31987654321", description: "Buffet especializado em festas temáticas personalizadas.", address_id: 3, payment_methods_id: 3 },
    { commercial_name: "Gastronomia Mágica", legal_name: "Gastronomia Mágica Eventos Especiais Ltda.", cnpj: "10101010101010", email: "gastronomiamagica@example.com", phone: "41987654321", description: "Surpreenda-se com pratos mágicos e experiências sensoriais únicas.", address_id: 4, payment_methods_id: 4 },
    { commercial_name: "Banquete dos Reis", legal_name: "Banquete dos Reis Eventos Sociais Ltda.", cnpj: "20202020202020", email: "banquetedosreis@example.com", phone: "51987654321", description: "Sinta-se como a realeza com nosso serviço exclusivo e cardápio requintado.", address_id: 5, payment_methods_id: 5 },
    { commercial_name: "Festival de Aromas", legal_name: "Festival de Aromas Produções Gastronômicas Ltda.", cnpj: "30303030303030", email: "festivaldearomas@example.com", phone: "61987654321", description: "Celebre a diversidade de sabores e aromas em nosso festival gastronômico.", address_id: 6, payment_methods_id: 6 },
    { commercial_name: "Cozinha dos Sonhos", legal_name: "Cozinha dos Sonhos Gastronomia e Eventos Ltda.", cnpj: "40404040404040", email: "cozinhadossonhos@example.com", phone: "71987654321", description: "Transformamos seus sonhos culinários em realidade.", address_id: 7, payment_methods_id: 7 },
    { commercial_name: "Sabores do Oriente", legal_name: "Sabores do Oriente Gastronomia Oriental Ltda.", cnpj: "50505050505050", email: "saboresdooriente@example.com", phone: "81987654321", description: "Viaje pelos aromas e sabores exóticos do oriente em nosso buffet.", address_id: 8, payment_methods_id: 8 },
    { commercial_name: "Gastronomia Futurista", legal_name: "Gastronomia Futurista Inovação em Eventos Ltda.", cnpj: "60606060606060", email: "gastronomiafuturista@example.com", phone: "91987654321", description: "Experimente pratos inovadores que exploram o futuro da gastronomia.", address_id: 9, payment_methods_id: 9 },
    { commercial_name: "Requinte & Sabor", legal_name: "Requinte & Sabor Eventos Exclusivos Ltda.", cnpj: "70707070707070", email: "requinteesabor@example.com", phone: "11198765432", description: "Uma combinação perfeita de elegância e sabores refinados para sua festa.", address_id: 10, payment_methods_id: 10 },
  ]
)

# Criando preços
Price.create!(
  [
    { base_price_weekdays: 150000, additional_person_price_weekdays: 10000, extra_event_hour_price_weekdays: 7500, base_price_weekend: 200000, additional_person_price_weekend: 15000, extra_event_hour_price_weekend: 10000 },
    { base_price_weekdays: 120000, additional_person_price_weekdays: 8000, extra_event_hour_price_weekdays: 6000, base_price_weekend: 180000, additional_person_price_weekend: 12000, extra_event_hour_price_weekend: 8000 },
    { base_price_weekdays: 120033, additional_person_price_weekdays: 8033, extra_event_hour_price_weekdays: 6033, base_price_weekend: 180033, additional_person_price_weekend: 12033, extra_event_hour_price_weekend: 8033 },
    { base_price_weekdays: 100000, additional_person_price_weekdays: 7000, extra_event_hour_price_weekdays: 5000, base_price_weekend: 150000, additional_person_price_weekend: 10000, extra_event_hour_price_weekend: 7500 },
    { base_price_weekdays: 350000, additional_person_price_weekdays: 30000, extra_event_hour_price_weekdays: 25000, base_price_weekend: 500000, additional_person_price_weekend: 40000, extra_event_hour_price_weekend: 30000 },
    { base_price_weekdays: 400000, additional_person_price_weekdays: 35000, extra_event_hour_price_weekdays: 30000, base_price_weekend: 600000, additional_person_price_weekend: 50000, extra_event_hour_price_weekend: 35000 },
  ]
)

# Criando eventos
Event.create!(
  [
    { name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1 },
    { name: "Festa de Aniversário Infantil", description: "Uma festa animada com buffet infantil, recreação e decoração temática.", min_people: 20, max_people: 30, default_event_duration_minutes: 180, alcoholic_drinks: false, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 2, buffet_id: 2 },
    { name: "Festa de 15 Anos", description: "Uma celebração especial para comemorar os 15 anos de uma jovem, com buffet personalizado e decoração deslumbrante.", min_people: 50, max_people: 100, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 3, buffet_id: 3 },
    { name: "Gastronomia do Futuro", description: "Um evento experimental que explora as tendências futuristas da gastronomia.", min_people: 30, max_people: 50, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: false, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 4, buffet_id: 4 },
    { name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 5 },
    { name: "Extravagância Gastronômica", description: "Um evento luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 6 },
    { name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 7 },
    { name: "Festa de Aniversário Infantil", description: "Uma festa animada com buffet infantil, recreação e decoração temática.", min_people: 20, max_people: 30, default_event_duration_minutes: 180, alcoholic_drinks: false, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 2, buffet_id: 8 },
    { name: "Festa de 15 Anos", description: "Uma celebração especial para comemorar os 15 anos de uma jovem, com buffet personalizado e decoração deslumbrante.", min_people: 50, max_people: 100, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 3, buffet_id: 9 },
    { name: "Gastronomia do Futuro", description: "Um evento experimental que explora as tendências futuristas da gastronomia.", min_people: 30, max_people: 50, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: false, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 4, buffet_id: 10 },
    { name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 2 },
    { name: "Extravagância Gastronômica", description: "Um evento luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 3 },
    { name: "Casamento Clássico", description: "Um casamento tradicional com buffet completo e decoração elegante.", min_people: 80, max_people: 150, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 4 },
    { name: "Festa de Aniversário Infantil", description: "Uma festa animada com buffet infantil, recreação e decoração temática.", min_people: 20, max_people: 30, default_event_duration_minutes: 180, alcoholic_drinks: false, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: false, price_id: 2, buffet_id: 5 },
    { name: "Festa de 15 Anos", description: "Uma celebração especial para comemorar os 15 anos de uma jovem, com buffet personalizado e decoração deslumbrante.", min_people: 50, max_people: 100, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 3, buffet_id: 6 },
    { name: "Gastronomia do Futuro", description: "Um evento experimental que explora as tendências futuristas da gastronomia.", min_people: 30, max_people: 50, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: false, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 4, buffet_id: 7 },
    { name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 8 },
    { name: "Extravagância Gastronômica", description: "Um evento luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 9 },
    { name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 4 },
    { name: "Extravagância Gastronômica", description: "Um evento luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 1 },
    { name: "Noite de Mistério", description: "Uma experiência intrigante com jantar temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 7 },
    { name: "Extravagância Gastronômica", description: "Um evento luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 10 },
    { name: "Dia de Mistério", description: "Uma experiência intrigante com almoço temático, mistério e entretenimento ao vivo.", min_people: 40, max_people: 60, default_event_duration_minutes: 300, alcoholic_drinks: true, decoration: true, parking_service: false, valet: false, exclusive_buffet_location: true, price_id: 5, buffet_id: 1 },
    { name: "Mega Gastronômia", description: "Um evento mega luxuoso com menu degustação de pratos exclusivos e harmonização de vinhos.", min_people: 20, max_people: 40, default_event_duration_minutes: 360, alcoholic_drinks: true, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 6, buffet_id: 2 },
  ]
)

# Criando usuários
User.create!(
  [
    { email: "hortency@email.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "Hortência Flores", cpf: "123.456.789-01", owner: true, buffet_id: 1 },
    { email: "partyplanner@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "PartyPlannerPro", cpf: "987.222.321-09", owner: true, buffet_id: 2 },
    { email: "banquetking@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "BanquetKing", cpf: "987.333.321-09", owner: true, buffet_id: 3 },
    { email: "foodie@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "FoodieFun", cpf: "321.555.444-01", owner: true, buffet_id: 4 },
    { email: "eventsrus@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "EventsRUs", cpf: "789.321.987-09", owner: true, buffet_id: 5 },
    { email: "celebrationsgalore@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "CelebrationsGalore", cpf: "666.666.666-01", owner: true, buffet_id: 6 },
    { email: "partyparadise@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "PartyParadise", cpf: "101.202.303-09", owner: true, buffet_id: 7 },
    { email: "banquethost@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "BanquetHost", cpf: "555.888.777-01", owner: true, buffet_id: 8 },
    { email: "eventexpert@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "EventExpert", cpf: "333.444.555-09", owner: true, buffet_id: 9 },
    { email: "partyplannerextraordinaire@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "PartyPlannerExtraordinaire", cpf: "777.999.333-01", owner: true, buffet_id: 10 },
    { email: "isaac@gmail.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "Isaac Quincy", cpf: "777.888.999-00", owner: false, buffet_id: nil },
    { email: "olivia.client@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "Olivia Client", cpf: "111.222.333-44", owner: false, buffet_id: nil },
    { email: "pablo.partygoer@example.com", encrypted_password: "$2a$12$yddcBgeR9j8exg1TyDUyku4rXu0ZqYp9YXUQuzhF0O.FiWPKL9/oi", name: "Pablo Partygoer", cpf: "444.555.666-77", owner: false, buffet_id: nil },
  ]
)

# Criando pedidos
Order.create!(
  [
    { code: "PED123", user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: "awaiting_buffet_evaluation" },
    { code: "PED456", user_id: 2, buffet_id: 2, event_id: 2, date: Date.today, guest_count: 50, more_details: "Detalhes do pedido 2", event_exclusive_address: false, address: "Endereço do pedido 2", status: "awaiting_buffet_evaluation" },
    { code: "PED789", user_id: 3, buffet_id: 3, event_id: 3, date: Date.today, guest_count: 70, more_details: "Detalhes do pedido 3", event_exclusive_address: true, address: "Endereço do pedido 3", status: "awaiting_buffet_evaluation" },
    { code: "PED101", user_id: 4, buffet_id: 4, event_id: 4, date: Date.today, guest_count: 100, more_details: "Detalhes do pedido 4", event_exclusive_address: true, address: "Endereço do pedido 4", status: "awaiting_buffet_evaluation" },
    { code: "PED202", user_id: 5, buffet_id: 5, event_id: 5, date: Date.today, guest_count: 120, more_details: "Detalhes do pedido 5", event_exclusive_address: false, address: "Endereço do pedido 5", status: "awaiting_buffet_evaluation" },
    { code: "PED303", user_id: 6, buffet_id: 6, event_id: 6, date: Date.today, guest_count: 90, more_details: "Detalhes do pedido 6", event_exclusive_address: true, address: "Endereço do pedido 6", status: "awaiting_buffet_evaluation" },
    { code: "PED404", user_id: 7, buffet_id: 7, event_id: 7, date: Date.today, guest_count: 60, more_details: "Detalhes do pedido 7", event_exclusive_address: true, address: "Endereço do pedido 7", status: "awaiting_buffet_evaluation" },
    { code: "PED505", user_id: 8, buffet_id: 8, event_id: 8, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 8", event_exclusive_address: false, address: "Endereço do pedido 8", status: "awaiting_buffet_evaluation" },
    { code: "PED606", user_id: 9, buffet_id: 9, event_id: 9, date: Date.today, guest_count: 110, more_details: "Detalhes do pedido 9", event_exclusive_address: true, address: "Endereço do pedido 9", status: "awaiting_buffet_evaluation" },
    { code: "PED707", user_id: 10, buffet_id: 10, event_id: 10, date: Date.today, guest_count: 70, more_details: "Detalhes do pedido 10", event_exclusive_address: true, address: "Endereço do pedido 10", status: "awaiting_buffet_evaluation" },
  ]
)
