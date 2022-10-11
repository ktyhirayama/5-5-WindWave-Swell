      PROGRAM SMB
C
      PARAMETER (G=9.806, PI=3.1415927)
C
      OPEN(10,FILE='SMB.DAT',STATUS='UNKNOWN')
C
      WRITE (*,'(A13,/)') '  == INPUT =='
      WRITE (*,10)
      READ  (*,*) U
      WRITE (*,20)
      READ  (*,*) F
C
      F  = F*1000.
      FU = G*F/(U*U)
C
      H = 0.30*(1.0-(1.0+0.004*FU**(1./2.))**(-2.))*U*U/G
      T = 1.37*(1.0-(1.0+0.008*FU**(1./3.))**(-5.))*2.0*PI*U/G
C
      WRITE (10,'(A12)') '== INPUT  =='
      WRITE (10,30) U,F/1000.
      WRITE (10,'(/,A12)') '== OUTPUT =='
      WRITE (10,40) H,T
C
      CLOSE(10)
      STOP
C
   10 FORMAT (5X,'Wind Velocity (m/s)   ?   ==> ',\)
   20 FORMAT (5X,'  Fetch       ( km )  ?   ==> ',\)
   30 FORMAT (5X,'  U  = ',F6.2,'(m/s)',5X,'  F  = ',F6.2,' (km)')
   40 FORMAT (5X,'H1/3 = ',F6.2,' (m) ',5X,'T1/3 = ',F5.2,' (sec)')
C
      END

