-- Name: Karen Jank
-- Date: February 14, 2023
-- Course: ITEC 320 Procedural Analysis and Design

-- Purpose: This program determines whether a positive integer is prime,
-- composite, or neither

-- Input is a series of numbers read in from a text file
-- Input assumed to be valid
-- Sample input: 16
-- 16
-- 16 is composite
-- The positive factors of 16 are: 1, 2, 4, 8, 16
-- The prime factorization of 16 is: 2 ** 4


with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure Numbers is

--------------------------------------------------------------------------------
-- Purpose: checks whether a number is prime or not
-- Parameters: n: the integer being tested
-- Precondition: n must be positive
-- Postcondition: Returns true if number is prime, false if number is not
--------------------------------------------------------------------------------

   function isPrime(n: Integer) return Boolean is

      prime : Boolean; -- true if n is prime, false if n is not
      mid : Integer; -- midpoint (n/2)

   begin
      mid := (n/2) + 1;
      for i in 2 .. mid loop
         if n = 2 or n mod i /= 0 then
            prime := True;
         else
            return False;
         end if;
      end loop;
      return prime;
   end isPrime;


--------------------------------------------------------------------------------
-- Purpose: returns the prime factorization of a number
-- Parameters: num: the integer that you want to get the prime factors for
-- Precondition: num must be positive
-- Postcondition: prints out the prime factors (ex: 150 -> 2 * 3 * 5 ** 2)
--------------------------------------------------------------------------------

   procedure primeFactors(num: Integer) is
      temp : Integer; -- temporary variable to store/modify num
      count : Integer; -- used to count how many times temp is divided by agiven
                       -- prime number (used for exponent value if necessary)

   begin
      temp := num;
      for i in 2 .. num - 1 loop
         if isPrime(i) then
            count := 0;
            while temp mod i = 0 loop
               count := count + 1;
               temp := temp/i;

            end loop;
            if temp = 1 then
               if count = 1 then
                  put(i, 0);
               elsif count > 1 then
                  put(i, 0); put(" ** "); put(count, 0);
               end if;
            else
               if count = 1 then
                  put(i, 0); put(" * ");
               elsif count > 1 then
                  put(i, 0); put(" ** "); put(count, 0); put(" * ");
               end if;
            end if;
         end if;
      end loop;

   end;

n: Integer; -- value from input

begin
   loop
      get(n);
      put(n, 0); new_line;

      if n = 1 then

         put(n, 0); put(" is neither prime nor composite");
         new_line;

      elsif isPrime(n) then

         put(n, 0); put(" is prime");
         new_line;

      else

         put(n, 0);
         put(" is composite");
         new_line;
         put("The positive factors of "); put(n, 0); put(" are: ");

         for i in 1 .. n - 1 loop

            if n mod i = 0 then
               put(i, 0); put(", ");
            end if;

         end loop;

         put(n, 0); new_line;
         put("The prime factorization of "); put(n, 0); put(" is: ");
         primeFactors(n);
         new_line;

      end if;

      new_line;

   end loop;

end Numbers;
