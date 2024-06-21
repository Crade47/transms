package validator

import (
	"runtime"
	"strings"
)

func validatePrefix(s *string) bool {
	if len(*s) != 2 {
		return false
	}

	charArr := strings.Split(*s, "")

	_, validOpPrefix := operatorPrefix[charArr[0]]
	_, validCirclePrefix := circleName[charArr[1]]

	return (validCirclePrefix && validOpPrefix)
}

func validateBankName(s *string) bool {
	if len(*s) != 6 {
		return false
	}
	_, validBankName := bankNameCode[*s]
	return validBankName

}

func ValidateSenderId(s *string) bool {

	if len(*s) != 9 {
		return false
	}

	parts := strings.Split(*s, "-")

	runtime.GOMAXPROCS(runtime.NumCPU())
	vPrefixChan := make(chan bool)
	vBankNameChan := make(chan bool)

	go func() {
		vPrefixChan <- validatePrefix(&parts[0])
	}()

	go func() {
		vBankNameChan <- validateBankName(&parts[1])
	}()

	validPrefix := <-vPrefixChan
	validBankName := <-vBankNameChan
	return validBankName && validPrefix
}
