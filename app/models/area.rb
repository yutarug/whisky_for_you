class Area < ApplicationRecord
    has_many :bottles, dependent: :destroy

    def self.all
        [
          {id: 1, name: 'スコッチ・ハイランド'},
          {id: 2, name: 'スコッチ・ローランド'},
          {id: 3, name: 'スコッチ・スペイサイド'},
          {id: 4, name: 'スコッチ・アイランズ'},
          {id: 5, name: 'スコッチ・アイラ'},
          {id: 6, name: 'スコッチ・キャンベルタウン'},
          {id: 7, name: 'アイリッシュ'},
          {id: 8, name: 'ジャパニーズ'},
          {id: 9, name: 'カナディアン'},
          {id: 10, name: 'アメリカン'},
          {id: 11, name: 'その他'}
        ]
      end
    
      def self.find(id)
        self.all.find{ |bottle| bottle[:id] == id.to_i }
      end
    
      def self.find_by_name(name)
        self.all.find{ |bottle| bottle[:name] == name }
      end
end
