!SOUND_MONO     = $00
!SOUND_STEREO   = $02

!MODE_EASY      = $00
!MODE_NORMAL    = $02
!MODE_HARD      = $04

!SELECTED_SOUND = $7e1f61
!SELECTED_MODE  = $7e1f69

!DEFAULT_SOUND  = !SOUND_STEREO
!DEFAULT_MODE   = !MODE_NORMAL

lorom

org $0080e9
        jsl     my_code
        nop
        nop

org $1ff800
my_code:
        lda.w   #!DEFAULT_SOUND
        sta.w   !SELECTED_SOUND

        ; replace original instructions
        lda.w   #!DEFAULT_MODE
        sta.w   !SELECTED_MODE
        rtl
