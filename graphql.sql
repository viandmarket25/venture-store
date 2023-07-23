{

    "queries":{
        "items":[
            {
                "activeOrder": "
                    query Order{
                        activeOrder{
                            id
                    
                    
                        }
                
                    }
                    "
            },
            {
                "AddItemToOrder":"
                    mutation AddItemToOrder($productVariantId: ID!, $quantity: Int!) {
                        addItemToOrder(productVariantId: $productVariantId, quantity: $quantity) {
                        __typename
                        ... on Order {
                            id
                            
                        
                            }
                        }
                    }
                  "
            }



            
        ]
        
    },
    "mutations":{
        "items":[



        ]
        
    }
}