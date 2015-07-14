class AddGroupToContest < ActiveRecord::Migration
  def up
    create_table :groups do |t|
      t.string :name
    end
    add_reference :contests, :group, index: true, foreign_key: true, null: false, :default => 1

  #create groups
    Group.new(name: "Общи").save!
    Group.new(name: "Контроли за IOI").save!
    Group.new(name: "Пролетен турнир").save!
    Group.new(name: "НОИ").save!
    Group.new(name: "Зимни състезания").save!
    Group.new(name: "Есенен турнир").save!
    Group.new(name: "RMMS").save!
    Group.new(name: "APIO").save!
    Group.new(name: "USACO").save!
    Group.new(name: "BOI and JBOI").save!
    Group.new(name: "ДАА").save!
    Group.new(name: "Арена").save!

      #match groups      
      Contest.find_each do |contest|
        if(contest.name.include? "контролно група")||(contest.name.include? "контролно групи")||(contest.name.include? "Контрол")||(contest.name.include? "контролно")
          contest.group_id = 2
          contest.save!
        elsif(contest.name.include? "Пролетен")
          contest.group_id = 3
          contest.save!
        elsif(contest.name.include? "НОИ")
          contest.group_id = 4
          contest.save!
        elsif(contest.name.include? "Зимни")||(contest.name.include? "ЗМП")
          contest.group_id = 5
          contest.save!
        elsif(contest.name.include? "Есенен")
          contest.group_id = 6
          contest.save!
        elsif(contest.name.include? "RMMS")
          contest.group_id = 7
          contest.save!
        elsif(contest.name.include? "APIO")
          contest.group_id = 8
          contest.save!
        elsif(contest.name.include? "USACO")
          contest.group_id = 9
          contest.save!
        elsif(contest.name.include? "BOI")
          contest.group_id = 10
          contest.save!
        elsif(contest.name.include? "ДАА")
          contest.group_id = 11
          contest.save!        
        elsif(contest.name.include? "Арена")||(contest.name.include? "Maycamp")
          contest.group_id = 12
          contest.save!
        else
          contest.group_id = 1
          contest.save!
        end
      end
  end



  def down
    drop_table :groups
  end
end

