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

function e = enhance(g)
[m n] =size(g);
e = zeros(m,n);
d = [ 1, 0; -1, 0; 1, 1; 0, 1; -1, 1; ...
      1, -1; 0, -1; -1, -1;2,2;1,2;0,2;...
      -1,2;-2,2;-2,1;-2,0;-2,-1;-2,-2; ...
      -1,-2;0,-2;1,-2;2,-2;2,-1;2,0;2,1]; 
for i=3:m-2
    for j=3:n-2
        e(i,j) = g(i,j);
        for k=1:24
            if(e(i,j)< g(i+d(k,1),j+d(k,2)))
                e(i,j) =  g(i+d(k,1),j+d(k,2));
            end
        end
    end
end
