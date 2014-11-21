package semi;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory getInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		System.out.println(cmd);
		if(cmd.equals("input"))
			return new InputCommand();
		else if(cmd.equals("output"))
			return new OutputCommand();
		else if(cmd.equals("final-sal-search"))
			return new final_sal_searchCommand();
		else if(cmd.equals("input-all-search"))
			return new Input_all_searchCommand();
		else if(cmd.equals("list-search"))
			return new List_searchCommand();
		else if(cmd.equals("input-search"))
			return new Input_SearchCommand();
		else if(cmd.equals("CurrentState"))
			return new CurrentState();
		else if(cmd.equals("SelectDate"))
			return new SelectDate();
		else if(cmd.equals("AlldateTest"))
			return new AlldateTest();
		else if(cmd.equals("total-input-search"))
			return new Total_inputCommand();
		else if(cmd.equals("total-output-search"))
			return new Total_outputCommand();
		else if(cmd.equals("plist-search"))
			return new Plist_searchCommand();
		else if(cmd.equals("output-all-search"))
			return new Output_all_searchCommand();
		else if(cmd.equals("stock-search"))
			return new Stock_searchCommand();
		else if(cmd.equals("sal-search"))
			return new Sal_searchCommand();
		else if(cmd.equals("add-list"))
			return new add_listCommand();
		else if(cmd.equals("des-sal-search"))
			return new des_sal_searchCommand();
		else if(cmd.equals("login"))
			return new loginTest();
		else if(cmd.equals("Tax-input-search"))
	         return new Tax_inputCommand();
	      else if(cmd.equals("Tax-output-search"))
	         return new Tax_outputCommand();
		
		
		
		
		
		return null;
	}
	
}
