require "rails_helper"

RSpec.describe Address, type: :model do
  describe "#valid?" do
    context "quando os campos obrigatórios estão ausentes" do
      it "retorna false se a rua estiver ausente" do
        address = Address.new(street: nil, number: "123", neighborhood: "Vila Mathias", state: "SP", city: "Santos", zip_code: "11050-000")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se o número estiver ausente" do
        address = Address.new(street: "Rua das Palmeiras", number: nil, neighborhood: "Vila Mathias", state: "SP", city: "Santos", zip_code: "11050-000")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se o bairro estiver ausente" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: nil, state: "SP", city: "Santos", zip_code: "11050-000")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se o estado estiver ausente" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: "Vila Mathias", state: nil, city: "Santos", zip_code: "11050-000")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se a cidade estiver ausente" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: "Vila Mathias", state: "SP", city: nil, zip_code: "11050-000")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se o código postal estiver ausente" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: "Vila Mathias", state: "SP", city: "Santos", zip_code: nil)
        expect(address.valid?).to eq(false)
      end
    end

    context "quando o formato do código postal estiver incorreto" do
      it "retorna false se o código postal não tiver exatamente 5 dígitos" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: "Vila Mathias", state: "SP", city: "Santos", zip_code: "110500")
        expect(address.valid?).to eq(false)
      end

      it "retorna false se o código postal contiver letras" do
        address = Address.new(street: "Rua das Palmeiras", number: "123", neighborhood: "Vila Mathias", state: "SP", city: "Santos", zip_code: "11050a")
        expect(address.valid?).to eq(false)
      end
    end
  end
end
