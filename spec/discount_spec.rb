require 'spec_helper'
require 'movie_ticket'

describe 'Discount' do
  subject do
    customer_type.discount(at)
  end

  context '一般' do
    let(:customer_type) { CustomerType::General.new }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(0)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(500)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(0)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(500)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end
  end

  context 'シネマシティズン60歳未満' do
    let(:customer_type) { CustomerType::CinemaCitizen.detect_by_age(59) }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(800)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(500)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(800)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end
  end

  context 'シネマシティズン60歳以上' do
    let(:customer_type) { CustomerType::CinemaCitizen.detect_by_age(60) }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(800)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(800)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(800)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(800)) }
    end
  end

  context 'シニア' do
    let(:customer_type) { CustomerType::Senior.new }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(700)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(700)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(700)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(700)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end
  end

  context '学生' do
    let(:customer_type) { CustomerType::Student.new }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(300)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(500)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(300)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(500)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(700)) }
    end
  end

  context '中高生' do
    let(:customer_type) { CustomerType::HightAndJuniorHighSchoolStudent.new }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Discount.new(800)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Discount.new(800)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }
        it { is_expected.to eq(Discount.new(800)) }
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Discount.new(800)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Discount.new(800)) }
    end
  end
end
