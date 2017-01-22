##
# require Rspec to run
# answer the questions by filling the let part

RSpec.describe "Strings" do
  context "i have strings initialized" do
    let(:a) {'Hello' }
    let(:b)  { 'World' }

    it "should be 'a' string that equals 'Hello'" do
      expect(a).to eq('Hello')
    end

    it "should be 'b' string that equals 'World'" do
      expect(b).to eq('World')
    end

    context "I concanate th strings" do
      let(:concatenated) { a + b }

      it "should be 'concatenated' that is the concatenation of 'a' and 'b'" do
        expect(concatenated).to eq('HelloWorld')
      end

      context "I count number of letters" do
        let(:count) { concatenated.size }

        it "should be 'count' that is the number of letters of 'concatenated'" do
          expect(count).to eq(10)
        end
      end
    end

    context "I want an array of chars for a" do
      let(:array) { a.chars }

      it "should be 'array' that is the array of chars in' a'" do
        expect(array).to eq(%w(H e l l o))
      end
    end

  # And so on, have a look on https://ruby-doc.org/core-2.2.0/String.html
  # Now the great part the famous caesar need the array part to be done

    context "Caesar : I make a rotation of 13 on each 'secret' letter" do
      let(:secret) { 'iamasecret' }
      let(:caesar) {
        secret.chars.map do |char|
          alphabet = ('a'..'z').to_a
          index = alphabet.index(char)
          alphabet.rotate(13)[index]
        end.join
      }
      it "should encrypt the secret with the caesar method" do
        expect(caesar).to eq('vnznfrperg')
      end
    end
  end
end
