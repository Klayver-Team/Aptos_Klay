module klaycontract_addr::Klay {

    use aptos_framework::event;
    use std::string::String;
    use std::signer;
    use aptos_std::table::{Self, Table}; 
    use aptos_framework::vector;
    use aptos_framework::coin;

      // Define a resource to hold the state of the contract
    struct KlayContentResource has drop, copy {
        klay_id_counter: u64,
        klays: vector<KlayPost>,
    }

   struct KlayPost has key, store, drop, copy {
      post_id: u64,
      address:address,
      content: String,
      image:  String,
      number_of_supporters: u64,
   }

   // Initialize the contract state
    public fun initialize(account: &signer) {
        let klay_content_resource = KlayContentResource {
            klay_id_counter: 0,
            klays: vector::empty(),
        };
    }

 public entry  fun createKlay(account: &signer, _content: String, _image: String) {
   let signer_address: address = signer::address_of(account);
   let counter = 0;
   let klay_content = KlayPost {
       post_id: counter,
       address: signer_address,
       content: _content,
       image: _image,
       number_of_supporters: 0, // Assuming you want to start with 0 supporters
   };
     move_to(account, klay_content);
   }
}