class Public::DiagnosesController < ApplicationController

    def diagnosis
    end

    def result

        # @bottles=Bottle.where(price_level:params[:price_level])
        #SQLなら・・・
        #select bottles.* form bottles left inner join tastes on tastes.bottle_id = bottles.id where tastes.peatry >= 7 and tastes.fuitty >= 7;
        # Bottle.joins(:tatste).where("taste.peaty >= ?", 7).where("taste.fruity >= ?", 7)

        #一旦価格別に分けてボトルを取得
        @bottles = Bottle.joins(:taste).where(price_level:params[:price_level])
        %i(peaty fruity floral feinty sulphury woody winey cereal).each do |key|
            @bottles = set_taste_condition(@bottles, key, params[key])
        end 
              
              

        # if params[:peaty].to_i==1
        #     number=0
        #     @bottles.each do |bottle|
                # if 7<=bottle.taste.peaty
                    # @bottles=[]
                    # @bottles<<Marshal.load(Marshal.dump(bottle))
                # end
            # number+=1
            # end
        # end
        @bottles.each do |bottle|
            logger.info "bottle.bottle_name=#{bottle.bottle_name}"
          end
          
    end
    private
    def set_taste_condition(bottles, key, value)
        case value.to_i
        when 1
          bottles = bottles.where("tastes.#{key} <= ?", 3)
        when 2 
          bottles = bottles.where("tastes.#{key} >= ?", 7) 
        end
      
        bottles 
    end
    
end
