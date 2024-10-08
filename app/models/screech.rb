class Screech < ApplicationRecord
    include PgSearch::Model

    pg_search_scope :search_full_text,
    against: {
        description: 'A',
        username: 'B',
        id: 'C',
    }    
end
