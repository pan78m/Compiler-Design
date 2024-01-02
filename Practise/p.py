import sympy as sp

def is_solvable(expression):
    try:
        sp.solvers.solve(expression)
        return True
    except sp.SolveFailed:
        return False
    except sp.PolynomialError:
        return False

# Example usage:
expression_to_check = "x**2 - 4"
result = is_solvable(expression_to_check)

if result:
    print(f"The expression '{expression_to_check}' is solvable.")
else:
    print(f"The expression '{expression_to_check}' is not solvable.")