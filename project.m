%%   Copyright 2013 Aroma Mahendru
%%
%%   you may not use this file except in compliance with the License.
%%   You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%%   Unless required by applicable law or agreed to in writing, software
%%   distributed under the License is distributed on an "AS IS" BASIS,
%%   See the License for the specific language governing permissions and
%%   limitations under the License.

function J = project(I)
[m n] = size(I);
 x = zeros(m,1);
 y = zeros(n,1);
for i=1:m
    for j=1:n
        x(i)= x(i) + I(i,j);
         y(j)= y(j) + I(i,j);
    end
end
figure, bar(x);
J = zeros(m,n);
for i=1:m
    if(x(i)> mean(x))
        J(i,:) = I(i,:);
    end
end
figure, imshow(J,[]);
end
