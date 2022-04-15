require './Classes/teacher'

describe Teacher do
  context 'when instantiated' do
    it 'with age, name, specialization, id it should create a teacher' do
      teacher = Teacher.new(45, 'Ramon', 'Java', 100)
      expect(teacher.class).to eq Teacher
      expect(teacher.name).to eq 'Ramon'
      expect(teacher.age).to eq 45
      expect(teacher.specialization).to eq 'Java'
      expect(teacher.id).to eq 100
    end

    it 'without specializations and id, it should create a student with default parameters' do
      teacher = Teacher.new(45, 'Ramon')
      expect(teacher.id).to be_between(1, 1000)
      expect(teacher.specialization).to eq 'Unknown'
    end
  end

  context 'when calling can_use_services? method' do
    it 'it should return true' do
      teacher = Teacher.new(45, 'Ramon')
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
