import warnings
import random

a = 3
m = 10
c = 2
x0 = 1
lista = [x0]
for i in range(1, 30):
    lista.append((lista[i - 1] * a + c) % m)

[print(i, end=", ") for i in lista]
print(f'm = {2**31}')

def RANDU(n, seed = 1):
    if seed >= 2 ** 31:
        warnings.warn(f'seed must be smaller than {2**31}. Using seed = 1.')
        seed = 1
    
    a = 2 ** 16 + 3
    m = 2 ** 31
    x0 = seed
    
    random_numbers = []
    
    for i in range(n):
        x0 = (a * x0) % m
        random_numbers.append(x0 / m)
        
    return random_numbers

def LFG(j, k, p, n):
    seed = [random.randint(0, 2 ** p) for i in range(j)]
    for i in range(n):
        seed.append((seed[i] + seed[j + i -k]) % (2 ** p))
    seed = [seed[i] / max(seed) for i in range(len(seed))]
    
    return seed[(j + 1):]
    

if __name__ == '__main__':
    print(RANDU(10, 112358))
    print(RANDU(10, 2 ** 31 + 3))
    print()
    print()
    print(LFG(17, 5, 31, 10))
