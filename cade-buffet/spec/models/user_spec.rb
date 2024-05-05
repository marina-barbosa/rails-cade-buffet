require "rails_helper"

RSpec.describe User, type: :model do
  describe "#valid?" do
    context "quando os campos obrigatórios estão ausentes" do
      it "retorna false se o nome estiver ausente" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, cpf: "12345678901", owner: true, buffet_id: 1)
        expect(user.valid?).to eq(false)
      end

      it "retorna false se o cpf estiver ausente" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, name: "Usuario", owner: true, buffet_id: 1)
        expect(user.valid?).to eq(false)
      end

      it "retorna false se o owner estiver ausente" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, name: "Usuario", cpf: "12345678901", buffet_id: 1)
        expect(user.valid?).to eq(false)
      end
    end

    context "quando o nome tem menos de 2 caracteres" do
      it "retorna false" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, cpf: "12345678901", owner: true, buffet_id: 1, name: "U")
        expect(user.valid?).to eq(false)
      end
    end

    context "quando o cpf não segue o formato correto" do
      it "retorna false se o cpf contiver letras" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, name: "Usuario", owner: true, buffet_id: 1, cpf: "12345678901a")
        expect(user.valid?).to eq(false)
      end

      it "retorna false se o cpf tiver menos de 11 dígitos" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, name: "Usuario", owner: true, buffet_id: 1, cpf: "123456789")
        expect(user.valid?).to eq(false)
      end
    end

    context "quando o owner não está dentro do intervalo permitido" do
      it "retorna false se owner for diferente de true ou false" do
        user = User.new(email: "usuario@example.com", encrypted_password: "senha123", reset_password_token: "token", reset_password_sent_at: Time.now, remember_created_at: Time.now, name: "Usuario", cpf: "12345678901", owner: "sim", buffet_id: 1)
        expect(user.valid?).to eq(false)
      end
    end
  end
end
