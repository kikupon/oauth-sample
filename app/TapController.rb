class TapController < UIViewController
  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Taps"
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)
    self.view.addSubview @label

    self.title = "Tap"
    right_button = UIBarButtonItem.alloc.initWithTitle("Push", style: UIBarButtonItemStyleBordered, target:self, action:'push')
    self.navigationItem.rightBarButtonItem = right_button

=begin
    @account_store = ACAccountStore.alloc.init
    @account_type = @account_store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook);
    @options = {ACFacebookAppIdKey       => '654511364587200',
                ACFacebookPermissionsKey => ['email'],
               }
    @account_store.requestAccessToAccountsWithType(@account_type, options: @options, completion: lambda do |granted, error|
                                                                                                   if granted
                                                                                                       accounts = @account_store.accountsWithAccountType(@account_type)
                                                                                                       anAccount = accounts.lastObject
                                                                                                       NSLog(anAccount("#{anAccount.description}"))
                                                                                                   else
                                                                                                       NSLog("error: #{error.description}")
                                                                                                   end
                                                                                                 end
                                                 )
=end
    @account_store = ACAccountStore.alloc.init
    @account_type = @account_store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter);
    @options = {ACFacebookAppIdKey       => '654511364587200',
                ACFacebookPermissionsKey => ['email'],
               }
    @options = nil
    @account_store.requestAccessToAccountsWithType(@account_type, options: @options, completion: lambda do |granted, error|
                                                                                                   if granted
                                                                                                       accounts = @account_store.accountsWithAccountType(@account_type)
                                                                                                       anAccount = accounts.lastObject
                                                                                                       user_id = anAccount.valueForKeyPath("properties.user_id")
                                                                                                       NSLog("#{user_id}")
                                                                                                       NSLog("#{anAccount.username}")
                                                                                                   else
                                                                                                       NSLog("error: #{error.description}")
                                                                                                   end
                                                                                                 end
                                                 )
  end

  def push
    #new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    #self.navigationController.pushViewController(new_controller, animated: true)
    @facebook = SLComposeViewController.composeViewControllerForServiceType(SLServiceTypeFacebook)
    self.presentViewController(@facebook, animated:TRUE, completion:nil)
  end
end
