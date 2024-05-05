# Criando endereços
Address.create!(
  [
    { street: "Rua A", number: "123", neighborhood: "Bairro A", city: "Cidade A", state: "Estado A", zip_code: "12345-678" },
    { street: "Rua C", number: "33", neighborhood: "Bairro C", city: "Cidade C", state: "EC", zip_code: "10005-600" },
    { street: "Rua B", number: "456", neighborhood: "Bairro B", city: "Cidade B", state: "Estado B", zip_code: "98765-432" },
  ]
)

# Criando métodos de pagamento
PaymentMethod.create!(
  [
    { credit_card: true, debit_card: true, pix: true, ticket_payment: false },
    { credit_card: true, debit_card: true, pix: true, ticket_payment: true },
    { credit_card: true, debit_card: false, pix: false, ticket_payment: true },
  ]
)

# Criando buffets
Buffet.create!(
  [
    { commercial_name: "Buffet A", legal_name: "Buffet Legal A", cnpj: "12345678901234", email: "buffetA@example.com", phone: "123456789", description: "Descrição do Buffet A", address_id: 1, payment_methods_id: 1 },
    { commercial_name: "Buffet B", legal_name: "Buffet Legal B", cnpj: "56789012345678", email: "buffetB@example.com", phone: "987654321", description: "Descrição do Buffet B", address_id: 2, payment_methods_id: 2 },
    { commercial_name: "Buffet C", legal_name: "Buffet legal C", cnpj: "56555512340008", email: "buffetC@example.com", phone: "980004321", description: "Descrição do Buffet C", address_id: 3, payment_methods_id: 3 },
  ]
)

# Criando preços
Price.create!(
  [
    { base_price_weekdays: 1000, additional_person_price_weekdays: 100, extra_event_hour_price_weekdays: 50, base_price_weekend: 1500, additional_person_price_weekend: 150, extra_event_hour_price_weekend: 75 },
  ]
)

# Criando eventos
Event.create!(
  [
    { name: "Evento A", description: "Descrição do Evento A", min_people: 50, max_people: 100, default_event_duration_minutes: 240, alcoholic_drinks: true, decoration: true, parking_service: true, valet: false, exclusive_buffet_location: true, price_id: 1, buffet_id: 1 },
    { name: "Evento B", description: "Descrição do Evento B", min_people: 30, max_people: 80, default_event_duration_minutes: 180, alcoholic_drinks: false, decoration: true, parking_service: false, valet: true, exclusive_buffet_location: false, price_id: 1, buffet_id: 2 },
    { name: "Evento C", description: "Descrição do Evento C", min_people: 31, max_people: 85, default_event_duration_minutes: 190, alcoholic_drinks: false, decoration: true, parking_service: true, valet: true, exclusive_buffet_location: true, price_id: 1, buffet_id: 3 },
  ]
)

# Criando usuários
User.create!(
  [
    { email: "dono1@example.com", encrypted_password: "123456", name: "Dono 1", cpf: "123.456.789-01", owner: true, buffet_id: 1 },
    { email: "dono2@example.com", encrypted_password: "123456", name: "Dono 2", cpf: "987.222.321-09", owner: true, buffet_id: 2 },
    { email: "dono3@example.com", encrypted_password: "123456", name: "Dono 3", cpf: "987.333.321-09", owner: true, buffet_id: 3 },
    { email: "cliente1@example.com", encrypted_password: "123456", name: "Cliente 1", cpf: "123.456.111-01", owner: false, buffet_id: nil },
    { email: "cliente2@example.com", encrypted_password: "123456", name: "Cliente 2", cpf: "987.654.222-09", owner: false, buffet_id: nil },
    { email: "cliente3@example.com", encrypted_password: "123456", name: "Cliente 3", cpf: "987.654.333-09", owner: false, buffet_id: nil },
  ]
)

# Criando pedidos
Order.create!(
  [
    { code: "PED123", user_id: 1, buffet_id: 1, event_id: 1, date: Date.today, guest_count: 80, more_details: "Detalhes do pedido 1", event_exclusive_address: true, address: "Endereço do pedido 1", status: "Em andamento" },
    { code: "PED456", user_id: 2, buffet_id: 2, event_id: 2, date: Date.today, guest_count: 50, more_details: "Detalhes do pedido 2", event_exclusive_address: false, address: "Endereço do pedido 2", status: "Aguardando confirmação" },
    { code: "PED456", user_id: 3, buffet_id: 3, event_id: 3, date: Date.today, guest_count: 50, more_details: "Detalhes do pedido 3", event_exclusive_address: true, address: "Endereço do pedido 3", status: "Aguardando confirmação" },
  ]
)
