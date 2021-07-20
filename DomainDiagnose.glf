#############################################################################
#
# (C) 2021 Cadence Design Systems, Inc. All rights reserved worldwide.
#
# This sample script is not supported by Cadence Design Systems, Inc.
# It is provided freely for demonstration purposes only.
# SEE THE WARRANTY DISCLAIMER AT THE BOTTOM OF THIS FILE.
#
#############################################################################

###############################################################################
##
## DomainDiagnose.glf
##
## Script with Tk interface to diagnose all enabled domains in the system and
## write a written report.
##
###############################################################################

package require PWI_Glyph 2.4
pw::Script loadTk

proc cadenceLogo {} {
  set logoData "
R0lGODlhgAAYAPQfAI6MjDEtLlFOT8jHx7e2tv39/RYSE/Pz8+Tj46qoqHl3d+vq62ZjY/n4+NT
T0+gXJ/BhbN3d3fzk5vrJzR4aG3Fubz88PVxZWp2cnIOBgiIeH769vtjX2MLBwSMfIP///yH5BA
EAAB8AIf8LeG1wIGRhdGF4bXD/P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIe
nJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtdGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1w
dGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1Nzo
wMSAgICAgICAgIj48cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudy5vcmcvMTk5OS8wMi
8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmY6YWJvdXQ9IiIg/3htbG5zO
nhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUcGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh
0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0idX
VpZDoxMEJEMkEwOThFODExMUREQTBBQzhBN0JCMEIxNUM4NyB4bXBNTTpEb2N1bWVudElEPSJ4b
XAuZGlkOkIxQjg3MzdFOEI4MTFFQjhEMv81ODVDQTZCRURDQzZBIiB4bXBNTTpJbnN0YW5jZUlE
PSJ4bXAuaWQ6QjFCODczNkZFOEI4MTFFQjhEMjU4NUNBNkJFRENDNkEiIHhtcDpDcmVhdG9yVG9
vbD0iQWRvYmUgSWxsdXN0cmF0b3IgQ0MgMjMuMSAoTWFjaW50b3NoKSI+IDx4bXBNTTpEZXJpZW
RGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MGE1NjBhMzgtOTJiMi00MjdmLWE4ZmQtM
jQ0NjMzNmNjMWI0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjBhNTYwYTM4LTkyYjItNDL/
N2YtYThkLTI0NDYzMzZjYzFiNCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g
6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgH//v38+/r5+Pf29fTz8vHw7+7t7Ovp6Ofm5e
Tj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66tr
KuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0
c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVlVUU1JRUE9OTUxLSklIR0ZFRENCQUA/Pj0
8Ozo5ODc2NTQzMjEwLy4tLCsqKSgnJiUkIyIhIB8eHRwbGhkYFxYVFBMSERAPDg0MCwoJCAcGBQ
QDAgEAACwAAAAAgAAYAAAF/uAnjmQpTk+qqpLpvnAsz3RdFgOQHPa5/q1a4UAs9I7IZCmCISQwx
wlkSqUGaRsDxbBQer+zhKPSIYCVWQ33zG4PMINc+5j1rOf4ZCHRwSDyNXV3gIQ0BYcmBQ0NRjBD
CwuMhgcIPB0Gdl0xigcNMoegoT2KkpsNB40yDQkWGhoUES57Fga1FAyajhm1Bk2Ygy4RF1seCjw
vAwYBy8wBxjOzHq8OMA4CWwEAqS4LAVoUWwMul7wUah7HsheYrxQBHpkwWeAGagGeLg717eDE6S
4HaPUzYMYFBi211FzYRuJAAAp2AggwIM5ElgwJElyzowAGAUwQL7iCB4wEgnoU/hRgIJnhxUlpA
SxY8ADRQMsXDSxAdHetYIlkNDMAqJngxS47GESZ6DSiwDUNHvDd0KkhQJcIEOMlGkbhJlAK/0a8
NLDhUDdX914A+AWAkaJEOg0U/ZCgXgCGHxbAS4lXxketJcbO/aCgZi4SC34dK9CKoouxFT8cBNz
Q3K2+I/RVxXfAnIE/JTDUBC1k1S/SJATl+ltSxEcKAlJV2ALFBOTMp8f9ihVjLYUKTa8Z6GBCAF
rMN8Y8zPrZYL2oIy5RHrHr1qlOsw0AePwrsj47HFysrYpcBFcF1w8Mk2ti7wUaDRgg1EISNXVwF
lKpdsEAIj9zNAFnW3e4gecCV7Ft/qKTNP0A2Et7AUIj3ysARLDBaC7MRkF+I+x3wzA08SLiTYER
KMJ3BoR3wzUUvLdJAFBtIWIttZEQIwMzfEXNB2PZJ0J1HIrgIQkFILjBkUgSwFuJdnj3i4pEIlg
eY+Bc0AGSRxLg4zsblkcYODiK0KNzUEk1JAkaCkjDbSc+maE5d20i3HY0zDbdh1vQyWNuJkjXnJ
C/HDbCQeTVwOYHKEJJwmR/wlBYi16KMMBOHTnClZpjmpAYUh0GGoyJMxya6KcBlieIj7IsqB0ji
5iwyyu8ZboigKCd2RRVAUTQyBAugToqXDVhwKpUIxzgyoaacILMc5jQEtkIHLCjwQUMkxhnx5I/
seMBta3cKSk7BghQAQMeqMmkY20amA+zHtDiEwl10dRiBcPoacJr0qjx7Ai+yTjQvk31aws92JZ
Q1070mGsSQsS1uYWiJeDrCkGy+CZvnjFEUME7VaFaQAcXCCDyyBYA3NQGIY8ssgU7vqAxjB4EwA
DEIyxggQAsjxDBzRagKtbGaBXclAMMvNNuBaiGAAA7"

  return [image create photo -format GIF -data $logoData]
}

namespace eval ::DomainDiagnose {

#
# buildGui - build all the widgets
#
proc buildGui { } {
  global DomainDiagnoseArray

  # Title bar
  wm title . "Domain Diagnostics"
  set DomainDiagnoseArray(top) [frame .top]
  set f [frame $DomainDiagnoseArray(top).titleFrame]
  pack $f -side top -fill x -pady 5
  set l [label $f.label -text "Domain Diagnostics" -justify center]
  set font [$l cget -font]
  set fontFamily [font actual $font -family]
  set fontSize [font actual $font -size]
  set bigLabelFont [font create -family $fontFamily -weight bold \
    -size [expr {2 * $fontSize}]]
  $l configure -font $bigLabelFont
  set regLabelFont [font create -family $fontFamily -weight bold \
    -size [expr {int(1.25 * $fontSize)}]]
  pack $l -side top
  set f [frame $DomainDiagnoseArray(top).hr1 -height 2 -relief sunken \
    -borderwidth 1]
  pack $f -side top -fill x -expand TRUE

  set DomainDiagnoseArray(gridFrame) \
    [frame $DomainDiagnoseArray(top).gridFrame]

  # Create the columns of functions, min range values, and max range values
  set togCol 0
  set minCol 1
  set maxCol 2
  set row 0
  set l [label "$DomainDiagnoseArray(gridFrame).funcLabel" -text "Function" \
    -justify center -font $regLabelFont]
  grid $l -column $togCol -row $row -sticky ew
  set l [label "$DomainDiagnoseArray(gridFrame).minLabel" -text "Min Range" \
    -justify center -font $regLabelFont]
  grid $l -column $minCol -row $row -sticky ew
  set l [label "$DomainDiagnoseArray(gridFrame).maxLabel" -text "Max Range" \
    -justify center -font $regLabelFont]
  grid $l -column $maxCol -row $row -sticky ew
  incr row
  foreach func $DomainDiagnoseArray(functions) {
    if {$DomainDiagnoseArray(${func}_Enabled)} {
      set state "normal"
    } else {
      set state "disabled"
      set DomainDiagnoseArray(${func}_On) 0
      set DomainDiagnoseArray(${func}_Min) {}
      set DomainDiagnoseArray(${func}_Max) {}
    }
    if {$DomainDiagnoseArray(${func}_On)} {
      set entryState "normal"
    } else {
      set entryState "disabled"
    }

    # Toggle button
    set name "$DomainDiagnoseArray(gridFrame).tb_$func"
    set text "$DomainDiagnoseArray(${func}_Label)"
    set tb [checkbutton $name -indicatoron TRUE -state $state \
      -variable DomainDiagnoseArray(${func}_On) -text $text \
      -command [list ::DomainDiagnose::toggleCB $func]]
    grid $tb -column $togCol -row $row -sticky w

    # Min range
    set name "$DomainDiagnoseArray(gridFrame).min_$func"
    set e [entry $name -state $state \
      -textvariable DomainDiagnoseArray(${func}_Min) \
      -validate all -vcmd [list ::DomainDiagnose::validateCB $func "Min" %P]]
    setEntryState $e $entryState
    grid $e -column $minCol -row $row -sticky ew

    # Max range
    set name "$DomainDiagnoseArray(gridFrame).max_$func"
    set e [entry $name -state $state \
      -textvariable DomainDiagnoseArray(${func}_Max) \
      -validate all -vcmd [list ::DomainDiagnose::validateCB $func "Max" %P]]
    setEntryState $e $entryState
    grid $e -column $maxCol -row $row -sticky ew

    incr row
  }
  grid columnconfigure $DomainDiagnoseArray(gridFrame) $minCol -weight 1
  grid columnconfigure $DomainDiagnoseArray(gridFrame) $maxCol -weight 1

  pack $DomainDiagnoseArray(gridFrame) -side top -fill x -expand FALSE \
    -padx 5 -pady 5

  # Another separator
  set f [frame $DomainDiagnoseArray(top).hr2 -height 2 -relief sunken \
    -borderwidth 1]
  pack $f -side top -fill x -expand FALSE

  # Buttons for controlling the output destination
  set outputFrame [frame $DomainDiagnoseArray(top).outputFrame]
  set l [label $outputFrame.l -text "Output:" -justify center]
  pack $l -side left -fill y -expand FALSE
  set DomainDiagnoseArray(output) "stdout"
  set rb [radiobutton $outputFrame.rb1 -indicatoron TRUE -value "stdout" \
    -text "Console" -variable DomainDiagnoseArray(output) \
    -command ::DomainDiagnose::changeOutputCB]
  pack $rb -side left -fill y -expand FALSE
  set rb [radiobutton $outputFrame.rb2 -indicatoron TRUE -value "file" \
    -text "File" -variable DomainDiagnoseArray(output) \
    -command ::DomainDiagnose::changeOutputCB]
  pack $rb -side left -fill y -expand FALSE
  set DomainDiagnoseArray(filenameEntry) [entry "$outputFrame.e" \
    -state "disabled" -width 30 -textvariable DomainDiagnoseArray(filename)]
  pack $DomainDiagnoseArray(filenameEntry) -side left -fill x -expand TRUE \
    -padx 3
  set DomainDiagnoseArray(browseButton) [button "$outputFrame.b" \
    -state "disabled" -text "..." -command ::DomainDiagnose::outputBrowserCB]
  pack $DomainDiagnoseArray(browseButton) -side left -fill none -expand FALSE
  setEntryState $DomainDiagnoseArray(filenameEntry) "disabled"

  pack $outputFrame -side top -fill x -expand TRUE -padx 5 -pady 5

  # Another separator
  set f [frame $DomainDiagnoseArray(top).hr3 -height 2 -relief sunken \
    -borderwidth 1]
  pack $f -side top -fill x -expand FALSE

  # Create the bottom buttons
  set f [frame $DomainDiagnoseArray(top).cmdFrame]
  set DomainDiagnoseArray(runButton) [button $f.run -width 8 -text "Run" \
    -command [list ::DomainDiagnose::runCB]]
  set b [button $f.cancel -width 8 -text "Cancel" \
    -command [list ::DomainDiagnose::cancelCB]]

  pack $DomainDiagnoseArray(runButton) -side right -padx 5
  pack $b -side right -padx 5
  pack [label $f.logo -image [cadenceLogo] -bd 0 -relief flat] -side left -padx 5
  pack $f -side top -fill x -expand FALSE -pady 5
  pack $DomainDiagnoseArray(top) -expand TRUE -fill both

  updateRunStatus

  # Center the window
  ::tk::PlaceWindow . widget

  set w [winfo reqwidth $DomainDiagnoseArray(top)]
  set h [winfo reqheight $DomainDiagnoseArray(top)]
  wm resizable . 1 0
  wm minsize . $w $h
}

#
# showError - show an error message in a pop-up window
#
proc showError { msg title } {
  tk_messageBox -message $msg -title $title -type ok -icon error
}

#
# printHeader - print a pretty header
#
proc printHeader { fd title } {
  set l [string length $title]
  set div [string repeat {=} 79]
  puts $fd "\n${div}"
  puts $fd "[string repeat { } [expr {int(40 - 0.5 * $l)}]]${title}"
  puts $fd "${div}\n"
}

#
# diagnoseRange - crunch out a particular function for each domain
#
proc diagnoseRange { fd func } {
  global DomainDiagnoseArray

  printHeader $fd $DomainDiagnoseArray(${func}_Label)

  set nameLen 10
  set headTextFmt "%-${nameLen}s%13s%13s%13s%10s%10s%10s"
  set headFmt "%-${nameLen}s%13s%13s%13s%10s%10s%10s"
  set dataFmt "%-${nameLen}s%13g%13g%13g%10d%10d%10d"
  set longFmt "%-s\n[string repeat { } ${nameLen}]%13g%13g%13g%10d%10d%10d"
  set hash [string repeat {-} 9]

  set minValue $DomainDiagnoseArray(${func}_Min)
  set maxValue $DomainDiagnoseArray(${func}_Max)

  # puts $fd [string repeat "123456789|" 8]
  set rangeArgs [list]
  if {![string equal "" $minValue]} {
    lappend rangeArgs -min $minValue
  } else {
    set minValue "n/a"
  }
  puts $fd "Minimum Range Value: $minValue"
  if {![string equal "" $maxValue]} {
    lappend rangeArgs -max $maxValue
  } else {
    set maxValue "n/a"
  }
  puts $fd "Maximum Range Value: $maxValue\n"

  puts $fd [format $headTextFmt "Domain" "Min" "Avg" "Max" \
    "Below" "In Range" "Above"]
  set hashDiv [format $headFmt [string repeat {-} $nameLen] $hash $hash $hash \
    $hash $hash $hash]
  puts $fd $hashDiv
  set count 0

  #
  # Make a list of all domains; Get the total number of domains
  #

  set AllDoms [pw::Grid getAll -type pw::Domain]
  set numDoms [llength $AllDoms]

  #
  # Set each domain identifier equal to a variable that can be output with its
  # range data;
  # Run each domain through domExamine for chosen diagnostics;
  #

  for {set domain 0} {$domain < $numDoms} {incr domain} {
    set dom [lindex $AllDoms $domain]
    if {[string equal $DomainDiagnoseArray(${func}_Type) "STRUCT"] && \
        [$dom isOfType pw::DomainUnstructured]} {
      continue
    }
    if {[string equal $DomainDiagnoseArray(${func}_Type) "UNSTRUCT"] && \
        [$dom isOfType pw::DomainStructured]} {
      continue
    }
    set dName [string range [$dom getName] 0 9]
    set fmt $dataFmt
    set dNameEval $dName
    set cmd [pw::Examine create $func]
    if {[string equal $minValue "n/a"]} {
      if {[string equal $maxValue "n/a"]} {
        $cmd setRangeLimits None None
      } else {
        $cmd setRangeLimits None $maxValue
      }
    } elseif {[string equal $maxValue "n/a"]} {
      $cmd setRangeLimits $minValue None
    } else {
      $cmd setRangeLimits $minValue $maxValue
    }
    $cmd addEntity $dom
    $cmd examine

    puts $fd [format $fmt $dName \
      [$cmd getMinimum] [$cmd getAverage] [$cmd getMaximum] \
      [$cmd getBelowRange] [$cmd getInRange] [$cmd getAboveRange]]
    # Add up the totals
    set numCells [expr {[$cmd getBelowRange] + [$cmd getInRange] + \
      [$cmd getAboveRange]}]
    if {0 == $count} {
      set total(min) [$cmd getMinimum]
      set total(max) [$cmd getMaximum]
      set total(num) $numCells
      set total(avg) [expr {[$cmd getAverage] * $numCells}]
      set total(low) [$cmd getBelowRange]
      set total(mid) [$cmd getInRange]
      set total(upp) [$cmd getAboveRange]
    } else {
      if {[$cmd getMinimum] < $total(min)} {
        set total(min) [$cmd getMinimum]
      }
      if {[$cmd getMaximum] > $total(max)} {
        set total(max) [$cmd getMaximum]
      }
      set total(num) [expr {$total(num) + $numCells}]
      set total(avg) [expr {$total(avg) + ([$cmd getAverage] * $numCells)}]
      set total(low) [expr {$total(low) + [$cmd getBelowRange]}]
      set total(mid) [expr {$total(mid) + [$cmd getInRange]}]
      set total(upp) [expr {$total(upp) + [$cmd getAboveRange]}]
    }
    incr count
    update idletasks
    $cmd delete
  }
  set total(avg) [expr {$total(avg) / $total(num)}]
  puts $fd $hashDiv
  puts $fd [format $dataFmt "Total" \
    $total(min) $total(avg) $total(max) \
    $total(low) $total(mid) $total(upp)]
  puts $fd "\n"
}

#
# run - do the crunching
#
proc run { } {
  global DomainDiagnoseArray

  if {[string equal $DomainDiagnoseArray(output) "file"]} {
    if {[catch {open $DomainDiagnoseArray(filename) "w"} fd]} {
      showError $fd "Opening File"
      return
    }
  } else {
    set fd "stdout"
  }

  set title "Domain Diagnostics"
  set l [string length $title]
  set div1 [string repeat {*} 79]
  set div2 "**[string repeat { } 75]**"
  puts $fd "$div1"
  puts $fd "$div1"
  puts $fd "$div2"
  set leadSp [expr {int(38 - 0.5 * $l)}]
  set trailSp [expr {75 - $l - $leadSp}]
  puts $fd "**[string repeat { } $leadSp]${title}[string repeat { } $trailSp]**"
  puts $fd "$div2"
  puts $fd "$div1"
  puts $fd "$div1"

  foreach func $DomainDiagnoseArray(functions) {
    if {$DomainDiagnoseArray(${func}_On)} {
      $DomainDiagnoseArray(${func}_Evaluator) $fd $func
    }
  }

  if {[string equal $DomainDiagnoseArray(output) "file"]} {
    catch {file close $fd}
  }
}

#
# runCB - callback for the run button
#
proc runCB { } {
  . configure -cursor watch
  update
  run
  exit
}

#
# outputBrowserCB - callback for launching the file browser
#
proc outputBrowserCB { } {
  global DomainDiagnoseArray

  set types {
    {{Text Files}      {.txt}   }
    {{Log Files}       {.log}   }
    {{All Files}       *        }
  }
  set cmd [list tk_getSaveFile -title {Select Diagnostics Output File} \
    -filetypes $types]
  set filename $DomainDiagnoseArray(filename)
  if {![string equal "" $filename]} {
    catch {
      set dir [file dirname $filename]
      if {![string equal "" $dir]} {
        lappend cmd -initialdir $dir
      }
    }
    catch {
      set name [file tail $filename]
      if {![string equal "" $name]} {
        lappend cmd -initialfile $name
      }
    }
    catch {
      set ext [file extension $filename]
      if {![string equal "" $ext]} {
        lappend cmd -defaultextension $ext
      }
    }
  } else {
    lappend cmd -defaultextension ".txt"
  }
  set filename [eval $cmd]
  if {![string equal "" $filename]} {
    set DomainDiagnoseArray(filename) $filename
  }
}

#
# changeOutputCB - callback for changing the output type
#
proc changeOutputCB { } {
  global DomainDiagnoseArray

  if {[string equal "file" $DomainDiagnoseArray(output)]} {
    set state "normal"
  } else {
    set state "disabled"
  }
  setEntryState $DomainDiagnoseArray(filenameEntry) $state
  $DomainDiagnoseArray(browseButton) configure -state $state
}

#
# cancelCB - callback for the cancel button
#
proc cancelCB { } {
  # Should only be called from GUI
  ::exit
}

#
# setEntryState - controls the appearance of entry widgets
#
proc setEntryState { entry state } {
  set grey "#e0e0e0"
  set font "#000000"
  set error "#ffc0c0"
  set normal "#ffffff"

  switch -exact -- $state {
    "disabled" {
        $entry configure -background $grey -foreground $grey -state $state
      }
    "normal" {
        $entry configure -background $normal -foreground $font -state $state
      }
    default {
        $entry configure -background $error -foreground $font -state "normal"
      }
  }
}

#
# toggleCB - callback for toggle buttons
#
proc toggleCB { func } {
  global DomainDiagnoseArray

  if {$DomainDiagnoseArray(${func}_On)} {
    set state "normal"
    checkRange $func "Min" $DomainDiagnoseArray(${func}_Min)
  } else {
    set state "disabled"
    setEntryState "$DomainDiagnoseArray(gridFrame).min_$func" "disabled"
    setEntryState "$DomainDiagnoseArray(gridFrame).max_$func" "disabled"
    set DomainDiagnoseArray(${func}_RangeValid) 1
  }
  set minButton "$DomainDiagnoseArray(gridFrame).min_$func"
  set maxButton "$DomainDiagnoseArray(gridFrame).max_$func"
  $minButton configure -state $state
  $maxButton configure -state $state
  updateRunStatus
}

#
# checkRange - check the min and max range values for validity
#
proc checkRange { func end newValue } {
  global DomainDiagnoseArray

  if {0 == $DomainDiagnoseArray(${func}_MinValid) || \
      0 == $DomainDiagnoseArray(${func}_MaxValid)} {
    set value 0
  } else {
    if {[string equal $end "Max"]} {
      set minValue $DomainDiagnoseArray(${func}_Min)
      set maxValue $newValue
    } else {
      set minValue $newValue
      set maxValue $DomainDiagnoseArray(${func}_Max)
    }
    if {[string equal "" $minValue] || [string equal "" $maxValue]} {
      set value 1
    } elseif {$minValue <= $maxValue} {
      set value 1
    } else {
      set value 0
    }
  }
  set DomainDiagnoseArray(${func}_RangeValid) $value

  set minButton "$DomainDiagnoseArray(gridFrame).min_$func"
  set maxButton "$DomainDiagnoseArray(gridFrame).max_$func"
  if {0 == $value} {
    setEntryState $minButton "error"
    setEntryState $maxButton "error"
  } else {
    setEntryState $minButton "normal"
    setEntryState $maxButton "normal"
  }
  return $value
}

#
# validateCB - callback for changes to range text entry widgets
#
proc validateCB { func end newValue } {
  global DomainDiagnoseArray

  if {[string is double $newValue]} {
    set valid 1
  } else {
    set valid 0
  }
  set DomainDiagnoseArray(${func}_${end}Valid) $valid
  set rangeValid [checkRange $func $end $newValue]

  updateRunStatus

  return TRUE
}

#
# updateRunStatus - sets the state of the run button
#
proc updateRunStatus { } {
  global DomainDiagnoseArray

  set activeFuncs 0
  set state "normal"
  foreach func $DomainDiagnoseArray(functions) {
    if {$DomainDiagnoseArray(${func}_On)} {
      if {0 == $DomainDiagnoseArray(${func}_RangeValid)} {
        set state "disabled"
        break
      }
      incr activeFuncs
    }
  }
  if {0 == $activeFuncs} {
    set state "disabled"
  }
  $DomainDiagnoseArray(runButton) configure -state $state
}

#
# setArray - conditionally sets an array element
#
proc setArray { arrayName overwrite element value } {
  upvar $arrayName a
  if {$overwrite || ![info exists a($element)]} {
    set a($element) $value
  }
}

#
# init - initializes the DomainDiagnoseArray structure
#
proc init { } {
  global DomainDiagnoseArray

  set funcList [list]
  set labelList [list]
  set typeList [list]
  set evalList [list]
  foreach entry {
        {DomainLengthI       "I Size"              "STRUCT" "diagnoseRange" }
        {DomainLengthJ       "J Size"              "STRUCT" "diagnoseRange" }
        {DomainArea          "Area"                "ANY"    "diagnoseRange" }
        {DomainLengthRatioI  "I Ratio"             "STRUCT" "diagnoseRange" }
        {DomainLengthRatioJ  "J Ratio"             "STRUCT" "diagnoseRange" }
        {DomainAspectRatio   "Aspect Ratio"        "ANY"    "diagnoseRange" }
        {DomainSmoothnessI   "I Smoothness"        "STRUCT" "diagnoseRange" }
        {DomainSmoothnessJ   "J Smoothness"        "STRUCT" "diagnoseRange" }
        {DomainMinimumAngle  "Minimum Angle"       "ANY"    "diagnoseRange" }
        {DomainMaximumAngle  "Maximum Angle"       "ANY"    "diagnoseRange" }
        {DomainSkewEquiangle "Equi-angle Skewness" "ANY"    "diagnoseRange" }
      } {
    foreach {function label type evaluator} $entry {break}
    lappend funcList $function
    lappend labelList $label
    lappend typeList $type
    lappend evalList $evaluator
  }
  setArray DomainDiagnoseArray TRUE "functions" $funcList
  foreach function $DomainDiagnoseArray(functions) \
          label $labelList type $typeList evaluator $evalList {
    setArray DomainDiagnoseArray TRUE "${function}_Label" $label
    setArray DomainDiagnoseArray TRUE "${function}_Evaluator" $evaluator
    setArray DomainDiagnoseArray TRUE "${function}_Type" $type
    setArray DomainDiagnoseArray TRUE "${function}_MinValid" 1
    setArray DomainDiagnoseArray TRUE "${function}_MaxValid" 1
    setArray DomainDiagnoseArray TRUE "${function}_RangeValid" 1
    setArray DomainDiagnoseArray FALSE "${function}_On" 0
    setArray DomainDiagnoseArray FALSE "${function}_Enabled" 1
    setArray DomainDiagnoseArray FALSE "${function}_Min" {}
    setArray DomainDiagnoseArray FALSE "${function}_Max" {}
    setArray DomainDiagnoseArray FALSE "filename" ""
  }
}

#
# prepare - disabled invalid functions based on present domain types
#
proc prepare { } {
  global DomainDiagnoseArray
  set haveStructured 0
  set haveUnstructured 0
  if {[expr {[pw::Grid getCount -type pw::DomainStructured] > 0}]} {
  set haveStructured 1;
  }
  if {[expr {[pw::Grid getCount -type pw::DomainUnstructured] > 0}]} {
    set haveUnstructured 1;
  }

  if {!$haveStructured} {
    foreach func $DomainDiagnoseArray(functions) {
      if {[string equal $DomainDiagnoseArray(${func}_Type) "STRUCT"]} {
        set DomainDiagnoseArray(${func}_Enabled) 0
      }
    }
  }
  if {!$haveUnstructured} {
    foreach func $DomainDiagnoseArray(functions) {
      if {[string equal $DomainDiagnoseArray(${func}_Type) "UNSTRUCT"]} {
        set DomainDiagnoseArray(${func}_Enabled) 0
      }
    }
  }
}

# Get the list of enabled domains
set domains [list]
foreach domain [pw::Grid getAll -type pw::Domain] {
  if {[$domain getEnabled]} {
    lappend domains $domain
  }
}

set numDomains [llength $domains]

}; # End of namespace ::DomainDiagnose


if {0 == $::DomainDiagnose::numDomains} {
  wm withdraw .
  update idletasks
  ::DomainDiagnose::showError "No enabled domains are present." \
    "Domain Diagnose"
  exit
} else {
  ::DomainDiagnose::init
  ::DomainDiagnose::prepare
  ::DomainDiagnose::buildGui
}

#############################################################################
#
# This file is licensed under the Cadence Public License Version 1.0 (the
# "License"), a copy of which is found in the included file named "LICENSE",
# and is distributed "AS IS." TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE
# LAW, CADENCE DISCLAIMS ALL WARRANTIES AND IN NO EVENT SHALL BE LIABLE TO
# ANY PARTY FOR ANY DAMAGES ARISING OUT OF OR RELATING TO USE OF THIS FILE.
# Please see the License for the full text of applicable terms.
#
#############################################################################
