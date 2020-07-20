package com.morackmorack.mvc.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

public class LogAspectJ {

	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("");
		System.out.println(">> [Around before] Å¸°Ù °´Ã¼.¸Þ¼­µå : "+joinPoint.getTarget().getClass().getName() +"."+joinPoint.getSignature().getName());
		
		if(joinPoint.getArgs().length !=0){
			System.out.println(">> [Around before]method¿¡ Àü´ÞµÇ´Â ÀÎÀÚ : "+ joinPoint.getArgs()[0]);
		}
		
		Object obj = joinPoint.proceed();

		System.out.println(">> [Around after] Å¸°Ù °´Ã¼return value  : "+obj);
		System.out.println("");
		
		return obj;
	}
	
}