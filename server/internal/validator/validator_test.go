package validator

import "testing"

// import "testing"

func TestValidatePrefix(t *testing.T) {

	tests := []struct {
		name     string
		input    string
		expected bool
	}{
		{"Valid prefix", "DA", true},
		{"Invalid operator prefix", "ZA", false},
		{"Invalid circle prefix", "DC", false},
		{"Both invalid prefixes", "ZZ", false},
		{"Too long input", "DAX", false},
		{"Empty input", "", false},
		{"Single character input", "D", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ans := validatePrefix(&tt.input)
			if ans != tt.expected {
				t.Errorf("Expected: %v Got: %v ", tt.expected, ans)
			}
		})
	}
}

func TestValidateBankName(t *testing.T) {
	tests := []struct {
		name     string
		input    string
		expected bool
	}{
		{"Valid Bank Name", "MAHABK", true},
		{"Invalid Bank Name", "MAHABR", false},
		{"Too long input", "AXISBANK", false},
		{"Empty input", "", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ans := validateBankName(&tt.input)
			if ans != tt.expected {
				t.Errorf("Expected: %v Got: %v ", tt.expected, ans)
			}
		})
	}
}

func TestValidSenderId(t *testing.T) {
	tests := []struct {
		name     string
		input    string
		expected bool
	}{
		{"Valid SenderId", "VK-MAHABK", true},
		{"Invalid SenderId with invalid OP-Prefix", "KV-MAHABK", false},
		{"Invalid SenderId with invalid Bank Name", "AX-AXIMBK", false},
		{"Empty input", "", false},
		{"String size too big", "AX-AXIMBANK", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ans := ValidateSenderId(&tt.input)
			if ans != tt.expected {
				t.Errorf("Expected: %v Got: %v ", tt.expected, ans)
			}
		})
	}
}
