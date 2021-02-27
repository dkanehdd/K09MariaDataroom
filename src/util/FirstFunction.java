package util;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class FirstFunction {

	public static void srcGuGudan(JspWriter out) {
		try{
			out.print("<table border='1'>");
			for(int su=1 ; su<=9 ; su++ ){
				out.print("<tr>");
				for(int dan=2 ; dan<=9 ; dan++){
					out.print("<td>"+dan+" * "+su+" = " + dan*su + "</td>");
				}	
				out.print("</tr>");	
			}
			out.print("</table>");
		}
		catch(IOException e){
			e.printStackTrace();
		}
	}
}
