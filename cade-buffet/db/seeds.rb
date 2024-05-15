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
    { street: "Rua Paulista", number: "1000", neighborhood: "Bela Vista", city: "São Paulo", state: "SP", zip_code: "01310" },
    { street: "Avenida Brigadeiro Faria Lima", number: "2000", neighborhood: "Itaim Bibi", city: "São Paulo", state: "SP", zip_code: "01452" },
    { street: "Rua Oscar Freire", number: "900", neighborhood: "Jardins", city: "São Paulo", state: "SP", zip_code: "01426" },
    { street: "Avenida Paulista", number: "1500", neighborhood: "Cerqueira César", city: "São Paulo", state: "SP", zip_code: "01310" },
    { street: "Rua do Lavradio", number: "71", neighborhood: "Centro", city: "Rio de Janeiro", state: "RJ", zip_code: "20230" },
    { street: "Rua Barata Ribeiro", number: "716", neighborhood: "Copacabana", city: "Rio de Janeiro", state: "RJ", zip_code: "22040" },
    { street: "Avenida Atlântica", number: "1702", neighborhood: "Copacabana", city: "Rio de Janeiro", state: "RJ", zip_code: "22021" },
    { street: "Rua Visconde de Pirajá", number: "550", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22410" },
    { street: "Rua Maria Quitéria", number: "27", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22410" },
    { street: "Avenida Vieira Souto", number: "500", neighborhood: "Ipanema", city: "Rio de Janeiro", state: "RJ", zip_code: "22420" },
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
    { email: "hortency@email.com", password: '123456', password_confirmation: '123456', name: "Hortência Flores", cpf: "12345678901", owner: true, buffet_id: 1 },
    { email: "partyplanner@example.com", password: '123456', password_confirmation: '123456', name: "PartyPlannerPro", cpf: "98722232109", owner: true, buffet_id: 2 },
    { email: "banquetking@example.com", password: '123456', password_confirmation: '123456', name: "BanquetKing", cpf: "98733332109", owner: true, buffet_id: 3 },
    { email: "foodie@example.com", password: '123456', password_confirmation: '123456', name: "FoodieFun", cpf: "32155544401", owner: true, buffet_id: 4 },
    { email: "eventsrus@example.com", password: '123456', password_confirmation: '123456', name: "EventsRUs", cpf: "78932198709", owner: true, buffet_id: 5 },
    { email: "celebrationsgalore@example.com", password: '123456', password_confirmation: '123456', name: "CelebrationsGalore", cpf: "66666666601", owner: true, buffet_id: 6 },
    { email: "partyparadise@example.com", password: '123456', password_confirmation: '123456', name: "PartyParadise", cpf: "10120230309", owner: true, buffet_id: 7 },
    { email: "banquethost@example.com", password: '123456', password_confirmation: '123456', name: "BanquetHost", cpf: "55588877701", owner: true, buffet_id: 8 },
    { email: "eventexpert@example.com", password: '123456', password_confirmation: '123456', name: "EventExpert", cpf: "33344455509", owner: true, buffet_id: 9 },
    { email: "partyplannerextraordinaire@example.com", password: '123456', password_confirmation: '123456', name: "PartyPlannerExtraordinaire", cpf: "77799933301", owner: true, buffet_id: 10 },
    { email: "isaac@gmail.com", password: '123456', password_confirmation: '123456', name: "Isaac Quincy", cpf: "77788899900", owner: false, buffet_id: nil },
    { email: "olivia.client@example.com", password: '123456', password_confirmation: '123456', name: "Olivia Client", cpf: "11122233344", owner: false, buffet_id: nil },
    { email: "pablo.partygoer@example.com", password: '123456', password_confirmation: '123456', name: "Pablo Partygoer", cpf: "44455566677", owner: false, buffet_id: nil },
  ]
)

# Criando pedidos
Order.create!(
  [
    { code: "PED123", user_id: 11, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: 0 },
    { code: "PED456", user_id: 12, buffet_id: 2, event_id: 2, date: Date.today, guest_count: 50, more_details: "Detalhes do pedido 2", event_exclusive_address: false, address: "Endereço do pedido 2", status: 0 },
    { code: "PED789", user_id: 13, buffet_id: 3, event_id: 3, date: Date.today, guest_count: 70, more_details: "Detalhes do pedido 3", event_exclusive_address: true, address: "Endereço do pedido 3", status: 0 },
    { code: "PED101", user_id: 11, buffet_id: 4, event_id: 4, date: Date.today, guest_count: 100, more_details: "Detalhes do pedido 4", event_exclusive_address: true, address: "Endereço do pedido 4", status: 0 },
    { code: "PED202", user_id: 12, buffet_id: 5, event_id: 5, date: Date.today, guest_count: 120, more_details: "Detalhes do pedido 5", event_exclusive_address: false, address: "Endereço do pedido 5", status: 0 },
    { code: "PED303", user_id: 13, buffet_id: 6, event_id: 6, date: Date.today, guest_count: 90, more_details: "Detalhes do pedido 6", event_exclusive_address: true, address: "Endereço do pedido 6", status: 0 },
    { code: "PED404", user_id: 11, buffet_id: 7, event_id: 7, date: Date.today, guest_count: 60, more_details: "Detalhes do pedido 7", event_exclusive_address: true, address: "Endereço do pedido 7", status: 0 },
    { code: "PED505", user_id: 12, buffet_id: 8, event_id: 8, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 8", event_exclusive_address: false, address: "Endereço do pedido 8", status: 0 },
    { code: "PED606", user_id: 13, buffet_id: 9, event_id: 9, date: Date.today, guest_count: 110, more_details: "Detalhes do pedido 9", event_exclusive_address: true, address: "Endereço do pedido 9", status: 0 },
    { code: "PED707", user_id: 11, buffet_id: 10, event_id: 10, date: Date.today, guest_count: 70, more_details: "Detalhes do pedido 10", event_exclusive_address: true, address: "Endereço do pedido 10", status: 0 },
  ]
)
