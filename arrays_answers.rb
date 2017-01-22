##
# require Rspec to run
# answer the questions by filling the before and let parts

RSpec.describe "Arrays" do
  context "I have arrays intialized (TIP use ranges)" do
    let(:a) { (0..99).to_a }
    let(:b) { (100..199).to_a }

    it "should have 'a' including each number from 0 to 99" do
      100.times do |i|
        expect(a).to include(i)
      end
    end

    it "should have 'b' including each number from 100 to 199" do
      100.times do |i|
        expect(b).to include(i + 100)
      end
    end

    context "I count the elements of 'a'" do
      let(:counted) { a.count }

      it "should have a 'counted' that is the number of elements of 'a'" do
        expect(counted).to eq(100)
      end
    end

    context "I have a concatenation of 'a' and 'b'" do
      let(:concatenated) { a + b }

      it "should have 'concatenated' that is a concatenation of 'a' and 'b'" do
        200.times do |i|
          expect(concatenated).to include(i)
        end
      end
    end

    context "I push an element to 'a'" do
      let(:pushed) { a << 'pushed' }

      it "should have an element 'pushed' at last of 'a'" do
        expect(pushed.last).to eq('pushed')
      end
    end

    context "I unshift an element to 'a'" do
      let(:unshifted) { a.unshift 'unshifted' }

      it "should have an element 'unshifted' at first of 'a'" do
        expect(unshifted.first).to eq('unshifted')
      end
    end

    context "I zip elements of 'a' with elements of 'b'" do
      let(:ziped) { a.zip b }

      it "should have 'ziped' that contains each pair of corresponding elements in 'a' and 'b'" do
        100.times do |i|
          expect(ziped).to include([i, i + 100])
        end
      end
    end

    context "I rotate 'a'" do
      let(:rotated) { a.rotate 10 }

      it "should have a 'rotated' that is a rotation of 'a' by 10" do
        i = 0
        # please don't do that :) it is ruby not js
        my_rotated = a.map do
          res = a[i + 10] || a[i - 90]
          i += 1
          res
        end

        expect(rotated).to eq(my_rotated)
      end
    end

    context "I have an array of 100 'nil'" do
      let(:nil_array) { Array.new(100) }

      it "should have 'nil_array' with 100 'nil'" do
        100.times do |i|
          expect(nil_array[i]).to be_nil
        end
      end

      context "I have a 'nil' element after each element of 'a'" do
        let(:dirty_a) { a.zip(nil_array).flatten }

        it "should have a 'dirty_a' that is as described before" do
          200.times do |i|
            if i.even?
              expect(dirty_a[i]).to eq(i/2)
            else
              expect(dirty_a[i]).to be_nil
            end
          end
        end

        context "I want to clean 'dirty_a'" do
          let(:clean_a) { dirty_a.compact }

          it "should have 'clean_a' that is 'dirty_a' with all nil removed" do
            expect(clean_a).not_to include(nil)
          end
        end
      end
    end

    context "I want to negate all numbers of 'a'" do
      let(:negated) { a.map(&:-@) }

      it "should have 'negated' that is all numbers of 'a' negated" do
        100.times do |i|
          expect(negated[i]).to eq(-i)
        end
      end
    end

    context "I want to have an array of even elements of 'a' but keep 'a'" do
      let(:just_even) { a.reject(&:odd?) }

      it "should have 'just_even' with only even elements of 'a'" do
        50.times do |i|
          expect(just_even[i]).to eq(i * 2)
        end
      end

      it "should have 'a' including each number from 0 to 99" do
        just_even
        100.times do |i|
          expect(a).to include(i)
        end
      end
    end

    context "I want to have an array of even elements of 'a' and modify 'a'" do
      before do
        a.reject!(&:odd?)
      end

      it "should have 'just_even' with only even elements of 'a'" do
        50.times do |i|
          expect(a[i]).to eq(i * 2)
        end
      end
    end

    context "I have an array that duplicates each element of a" do
      let(:duplicated) { a.zip(a).flatten }

      it "should have 'duplicated' that duplicates each element of 'a' after its occurence" do
        (0..199).step(2) do |i|
          expect(duplicated[i]).to eq(i / 2)
          expect(duplicated[i + 1]).to eq(i / 2)
        end
      end

      context "I delete duplicates from 'duplicated'" do
        let(:uniqed) { duplicated.uniq }

        it "should have 'uniqued' that remove duplicates of 'duplicated'" do
          100.times do |i|
            expect(uniqed.select { |e| e == i }.count).to eq(1)
          end
        end
      end
    end

    context "I want to sum up 'a'" do
      let(:sum) { a.reduce(:+) }

      it "should have 'sum' that is the sum of all numbers of 'a'" do
        expect(sum).to eq((99 * (99 + 1)) / 2)
      end
    end
  end

  # And so on see https://ruby-doc.org/core-1.9.3/Range.html to go further
  # now FizzBuzz exercise !

  context "I want to fizz buzz on first 100 numbers" do
    let(:fizzbuzz) { (1..100).to_a.map do |i|
      res = ""
      res += 'Fizz' if (i % 3).zero?
      res += 'Buzz' if (i % 5).zero?
      res.empty? ? i : res
    end }

    it "should have 'fizzbuzz' that fit the exercise" do
      (1..100).to_a.each do |i|
        expect(fizzbuzz[i-1] =~ /Fizz/).to be_truthy if (i % 3).zero?
        expect(fizzbuzz[i-1] =~ /Buzz/).to be_truthy if (i % 5).zero?
        expect(fizzbuzz[i-1]).to eq(i) unless (i % 5).zero? || (i % 3).zero?
      end
    end
  end
end
