      PROGRAM SWELL
C
      PARAMETER (G=9.806, PI=3.1415927)
C
      AK1 = 0.4
      AK2 = 2.0
C
      OPEN(10,FILE='SWELL.DAT',STATUS='UNKNOWN')
C
      WRITE (*,'(A13,/)') '  == INPUT =='
      WRITE (*,10)
      READ  (*,*) H13F
      WRITE (*,20)
      READ  (*,*) T13F
      WRITE (*,30)
      READ  (*,*) Fmin
      WRITE (*,40)
      READ  (*,*) D
C
      H13D = H13F*sqrt( AK1*Fmin/(AK1*Fmin+D) )
      T13D = T13F*sqrt( AK2+(1.-AK2)*H13D/H13F )
C
      Time = 4.*PI*(D*1000.)/G/T13D
      Time = Time/3600.
C
      WRITE (10,'(A12)') '== INPUT  =='
      WRITE (10,50) H13F,T13F
      WRITE (10,60) Fmin,D
      WRITE (10,'(/,A12)') '== OUTPUT =='
      WRITE (10,70) H13D,T13D
      WRITE (10,80) Time
C
      CLOSE(10)
      STOP
C
   10 FORMAT (5X,'Height of Wind wave (m)   ?   ==> ',\)
   20 FORMAT (5X,'Period of Wind wave (s)   ?   ==> ',\)
   30 FORMAT (5X,'Minimum Fetch (km)   ?   ==> ',\)
   40 FORMAT (5X,'Reduction Distance of Swell (km)   ?   ==> ',\)

   50 FORMAT (5X,'H1/3F= ',F6.2,' (m)' ,5X,'T1/3F= ',F6.2,' (sec)')
   60 FORMAT (5X,' Fmin= ',F6.1,' (km)',5X,'  D  = ',F6.1,' (km)')
   70 FORMAT (5X,'H1/3D= ',F6.2,' (m) ',5X,'T1/3D= ',F6.2,' (sec)')
   80 FORMAT (5X,'Propagation Time= ',F6.2,' (hr)')
C
      END

