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
		{"Invalid circle prefix", "ZD", false},
		{"Both invalid prefixes", "ZZ", false},
		{"Too long input", "DAX", false},
		{"Empty input", "", false},
		{"Single character input", "D", false},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			ans := ValidatePrefix(&tt.input)
			if ans != tt.expected {
				t.Errorf("Expected: %v Got: %v ", tt.expected, ans)
			}
		})
	}
}
