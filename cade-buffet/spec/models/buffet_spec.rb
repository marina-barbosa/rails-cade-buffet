require "rails_helper"

RSpec.describe Buffet, type: :model do
  describe "#valid?" do
    describe "When is empty the" do
      it "commercial_name" do
        buffet = Buffet.new(commercial_name: "", legal_name: "Bistrô do Sol Nascente", cnpj: "12345678901234",
                            phone: "98765432100", email: "bistronascencao@buffet.com", description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.").valid?

        expect(buffet).to eq false
      end

      it "legal_name" do
        buffet = Buffet.new(commercial_name: "Bistrô do Sol Nascente", legal_name: "", cnpj: "12345678901234",
                            phone: "98765432100", email: "bistronascencao@buffet.com", description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.").valid?

        expect(buffet).to eq false
      end

      it "cnpj" do
        buffet = Buffet.new(commercial_name: "Bistrô do Sol Nascente", legal_name: "Bistrô do Sol Nascente", cnpj: "",
                            phone: "98765432100", email: "bistronascencao@buffet.com", description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.").valid?

        expect(buffet).to eq false
      end

      it "phone" do
        buffet = Buffet.new(commercial_name: "Bistrô do Sol Nascente", legal_name: "Bistrô do Sol Nascente", cnpj: "12345678901234",
                            phone: "", email: "bistronascencao@buffet.com", description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.").valid?

        expect(buffet).to eq false
      end

      it "email" do
        buffet = Buffet.new(commercial_name: "Bistrô do Sol Nascente", legal_name: "Bistrô do Sol Nascente", cnpj: "12345678901234",
                            phone: "98765432100", email: "", description: "Buffet especializado em pratos vegetarianos e veganos, com ingredientes frescos e orgânicos.").valid?

        expect(buffet).to eq false
      end

      it "description" do
        buffet = Buffet.new(commercial_name: "Bistrô do Sol Nascente", legal_name: "Bistrô do Sol Nascente", cnpj: "12345678901234",
                            phone: "98765432100", email: "bistronascencao@buffet.com", description: "").valid?

        expect(buffet).to eq false
      end
    end
  end
end
