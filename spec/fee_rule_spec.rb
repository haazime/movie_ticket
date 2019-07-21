require 'spec_helper'

describe '料金ルール' do
  subject do
    screening = Screening.new(at, sound_type)
    FeeRule.determine(customer_type, screening)
  end

  let(:sound_type) { SoundType::Normal }

  context '一般' do
    let(:customer_type) { CustomerType::General }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Weekday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Weekday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Weekday, ShowType::Normal)) }
        end
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Holiday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Holiday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::General, DayType::Holiday, ShowType::Normal)) }
        end
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::General, DayType::DayOfCinema, nil)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::General, DayType::DayOfCinema, nil)) }
    end
  end

  context 'シネマシティズン60歳未満' do
    let(:customer_type) { CustomerType::CinemaCitizen }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Weekday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Weekday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Weekday, ShowType::Normal)) }
        end
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Holiday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Holiday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Holiday, ShowType::Normal)) }
        end
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::Weekday, nil)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizen, DayType::DayOfCinema, nil)) }
    end
  end

  context 'シネマシティズン60歳以上' do
    let(:customer_type) { CustomerType::CinemaCitizenOver60 }

    context '平日' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-10 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Weekday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-10 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Weekday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Weekday, ShowType::Normal)) }
        end
      end
    end

    context '土日祝' do
      context '~20:00' do
        let(:at) { ScreeningAt.parse('2019-07-13 15:30') }
        it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Holiday, ShowType::Normal)) }
      end

      context '20:00~' do
        let(:at) { ScreeningAt.parse('2019-07-13 20:15') }

        context '通常上映' do
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Holiday, ShowType::Late)) }
        end

        context '爆音上映' do
          let(:sound_type) { SoundType::Explosion }
          it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::Holiday, ShowType::Normal)) }
        end
      end
    end

    context '映画の日（平日）' do
      let(:at) { ScreeningAt.parse('2019-07-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::DayOfCinema, nil)) }
    end

    context '映画の日（土日祝）' do
      let(:at) { ScreeningAt.parse('2019-06-01 15:30') }
      it { is_expected.to eq(Fee.new(CustomerType::CinemaCitizenOver60, DayType::DayOfCinema, nil)) }
    end
  end
end
