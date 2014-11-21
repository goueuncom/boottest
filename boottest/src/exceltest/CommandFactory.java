package exceltest;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();

	public static CommandFactory getInstance() {
		return instance;
	}
	public Command createCommand(String exIcmd){
		System.out.println(exIcmd);
		if(exIcmd.equals("excel-input"))
			return new Excel_InputCommand();
		
		return null;
	}
}